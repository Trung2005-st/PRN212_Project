using System.IO;
using System.Windows;

namespace QuitHubWPF_App
{
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            LoadHeader();
        }

        private void LoadHeader()
        {
            if (File.Exists("Login.txt"))
            {
                string[] data = File.ReadAllText("Login.txt").Split(';');
                if (data.Length >= 1)
                {
                    welcomeText.Text = $"Welcome, Admin {data[0]}";
                }
            }
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }

        private void ManageUsers_Click(object sender, RoutedEventArgs e)
        {
            new UserManagementWindow().Show();
            this.Close();
        }

        private void ManagePlans_Click(object sender, RoutedEventArgs e)
        {
            new ManagePlanWindow().Show();
            this.Close();
        }

        private void ManageFeedback_Click(object sender, RoutedEventArgs e)
        {
            new FeedbackManagementWindow().Show();
            this.Close();
        }

        private void Reports_Click(object sender, RoutedEventArgs e)
        {
            new DashboardReportManagement().Show();
            this.Close();
        }
    }
}
