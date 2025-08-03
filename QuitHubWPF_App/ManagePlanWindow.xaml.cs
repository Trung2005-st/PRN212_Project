using System;
using System.Windows;
using System.Windows.Controls;
using Service;

namespace QuitHubWPF_App
{
    public partial class ManagePlanWindow : Window
    {
        private readonly IAdminPlanService _service = new AdminPlanService();
        private int _currentUserId = -1;
        private const string Placeholder = "Search user plan...";

        public ManagePlanWindow()
        {
            InitializeComponent();
            LoadStatistics();
        }

        private void LoadStatistics()
        {
            int usersWithPlans = _service.GetUserCountWithPlans();
            int totalUsers = _service.GetTotalUserCount();
            txtStatistic.Text = $"Users with Plans: {usersWithPlans} / {totalUsers}";
        }

        private void txtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (dgPlans == null || txtStatistic == null) return;
            string keyword = txtSearch.Text.Trim();

            if (string.IsNullOrEmpty(keyword) || keyword == Placeholder)
            {
                dgPlans.ItemsSource = null;
                txtStatistic.Text = "";
                return;
            }

            var plan = _service.GetLatestPlanByUser(keyword);

            if (plan == null)
            {
                dgPlans.ItemsSource = null;
                txtStatistic.Text = $"No results for '{keyword}'";
                return;
            }

            _currentUserId = plan.UserId;

            var displayList = new[]
            {
                new
                {
                    plan.UserId,
                    plan.Username,
                    plan.FullName,
                    plan.QuitDate,
                    ReasonsString = string.Join(", ", plan.Reasons),
                    StepsString = string.Join(" → ", plan.Steps)
                }
            };

            dgPlans.ItemsSource = displayList;
            LoadStatistics();
        }

        private void txtSearch_GotFocus(object sender, RoutedEventArgs e)
        {
            if (txtSearch.Text == Placeholder)
            {
                txtSearch.Text = "";
                txtSearch.Foreground = System.Windows.Media.Brushes.Black;
            }
        }

        private void txtSearch_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSearch.Text))
            {
                txtSearch.Text = Placeholder;
                txtSearch.Foreground = System.Windows.Media.Brushes.Gray;
            }
        }

        private void ViewHistory_Click(object sender, RoutedEventArgs e)
        {
            if (_currentUserId == -1)
            {
                MessageBox.Show("Search for a user first.", "Notice", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }

            var allPlans = _service.GetAllPlansByUser(_currentUserId);

            if (allPlans == null || allPlans.Count == 0)
            {
                MessageBox.Show("No plan history available for this user.");
                return;
            }

            var historyWindow = new PlanHistoryWindow(allPlans);
            historyWindow.ShowDialog();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            var adminWindow = new AdminWindow();
            adminWindow.Show();
            this.Close();
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            var loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }
    }
}
