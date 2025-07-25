using System;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Animation;
using Service;

namespace QuitHubWPF_App
{
    public partial class RegisterWindow : Window
    {
        private Storyboard loadingStoryboard;
        IUserService service = new UserService();

        public RegisterWindow()
        {
            InitializeComponent();
            SetupLoadingAnimation();
        }

        private void SetupLoadingAnimation()
        {
            DoubleAnimation rotate = new DoubleAnimation(0, 360, new Duration(TimeSpan.FromSeconds(1)));
            rotate.RepeatBehavior = RepeatBehavior.Forever;

            loadingStoryboard = new Storyboard();
            Storyboard.SetTarget(rotate, spinnerRotate);
            Storyboard.SetTargetProperty(rotate, new PropertyPath("Angle"));
            loadingStoryboard.Children.Add(rotate);
        }

        private async void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Password.Trim();
            string confirmPassword = txtConfirmPassword.Password.Trim();

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(confirmPassword))
            {
                MessageBox.Show("All fields are required.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (password != confirmPassword)
            {
                MessageBox.Show("Passwords do not match.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Show spinner
            registerContent.Visibility = Visibility.Collapsed;
            registerSpinner.Visibility = Visibility.Visible;
            loadingStoryboard.Begin();

            await Task.Delay(700); // Simulate delay

            var result= service.Register(username, password);

            loadingStoryboard.Stop();
            registerSpinner.Visibility = Visibility.Collapsed;
            registerContent.Visibility = Visibility.Visible;

            if (result != null)
            {

                MessageBox.Show("Registration successful!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                new LoginWindow().Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Registration failed. Username may already exist.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
        }

        private void WebLink_Click(object sender, MouseButtonEventArgs e)
        {
            Process.Start(new ProcessStartInfo("http://localhost:5173") { UseShellExecute = true });
        }

        private void OpenLoginWindow(object sender, MouseButtonEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }
    }
}
