using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using BusinessObject;
using Service;

namespace QuitHubWPF_App
{
    /// <summary>
    /// Interaction logic for UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        User currentUser;
        private readonly int _userId;
        IUserService userService = new UserService();
        private readonly IQuitPlanService _quitPlanService = new QuitPlanService();
        public UserWindow(int userId)
        {
            InitializeComponent();
            currentUser = userService.GetUserByIdWithRole(userId);
            _userId = userId;
            if (currentUser != null)
            {
                txtWelcome.Text = $"Welcome to Quithub, {currentUser.Username}!";
            }
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }

        private void ManageInfo_Click(object sender, RoutedEventArgs e)
        {
            var window = new ManageInfoWindow(currentUser.UserId);
            window.Show();
            this.Close();
        }

        private void CreatePlan_Click(object sender, RoutedEventArgs e)
        {
            var createPlanWindow = new CreateQuitPlanWindow(currentUser.UserId, this); // truyền UserWindow hiện tại

            createPlanWindow.Show();
            this.Hide();
        }

        private void ViewPlans_Click(object sender, RoutedEventArgs e)
        {
            var latestPlan = _quitPlanService.GetLatestPlanForUser(_userId);

            if (latestPlan != null)
            {
                var checklistWindow = new ChecklistStepWindow(latestPlan.QuitPlanId, _userId, this);
                checklistWindow.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("You have not created a quit plan yet.", "No Plan Found", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void Feedback_Click(object sender, RoutedEventArgs e)
        {
            var window= new FeedbackWindow(currentUser);
            window.Show();
            this.Close();
        }

        private void Counseling_Click(object sender, RoutedEventArgs e)
        {
            var window = new UserCounselingSchedulesWindow(currentUser);
            window.Show();
            this.Close();
        }
    }
}
