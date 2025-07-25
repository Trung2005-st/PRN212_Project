using System;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using BusinessObject;
using Service;

namespace QuitHubWPF_App
{
    public partial class LoginWindow : Window
    {
        IUserService service = new UserService();
        private Storyboard loadingStoryboard;

        public LoginWindow()
        {
            InitializeComponent();
            SetupLoadingAnimation();
            SetUpRememberMeLogin();
        }

        private void SetUpRememberMeLogin()
        {
            string path = "Login.txt";
            if (File.Exists(path))
            {
                string[] data = File.ReadAllText(path).Split(';');
                if (data.Length == 2)
                {
                    txtUsername.Text = data[0];
                    txtPassword.Password = data[1];
                    remember_clicked.IsChecked = true;
                }
            }
        }

        private void SetupLoadingAnimation()
        {
            DoubleAnimation rotate = new DoubleAnimation(0, 360, new Duration(TimeSpan.FromSeconds(1)));
            rotate.RepeatBehavior = RepeatBehavior.Forever;

            loadingStoryboard = new Storyboard();
            Storyboard.SetTarget(rotate, spinnerRotate);
            Storyboard.SetTargetProperty(rotate, new PropertyPath(RotateTransform.AngleProperty));
            loadingStoryboard.Children.Add(rotate);
        }

        private async void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Password.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Username and password cannot be empty.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Show spinner
            loginContent.Visibility = Visibility.Collapsed;
            loginSpinner.Visibility = Visibility.Visible;
            loadingStoryboard.Begin();

            await Task.Delay(700); // Simulate delay or replace with actual async login

            var user = service.Login(username, password);

            // Hide spinner
            loadingStoryboard.Stop();
            loginSpinner.Visibility = Visibility.Collapsed;
            loginContent.Visibility = Visibility.Visible;

            if (user != null)
            {
                if (remember_clicked.IsChecked == true)
                {
                    string data = $"{username};{password}";
                    File.WriteAllText("Login.txt", data);
                }
                else
                {
                    // Nếu không tick thì xóa file cũ nếu tồn tại
                    if (File.Exists("Login.txt"))
                        File.Delete("Login.txt");
                }
                if (user.RoleId == 1)
                {
                    new UserWindow().Show();
                }
                else if (user.RoleId == 2)
                {
                    new AdminWindow().Show();
                }
                else
                {
                    new CounselorWindow().Show();
                }
                this.Close();
            }
            else
            {
                MessageBox.Show("Invalid username or password.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void WebLink_Click(object sender, MouseButtonEventArgs e)
        {
            Process.Start(new ProcessStartInfo("http://localhost:5173") { UseShellExecute = true });
        }

        private void OpenRegisterWindow(object sender, MouseButtonEventArgs e)
        {
            RegisterWindow registerWindow = new RegisterWindow();
            registerWindow.Show();
            this.Close();
        }
    }
}
