using Service;
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

namespace QuitHubWPF_App
{
    /// <summary>
    /// Interaction logic for CreateQuitPlanWindow.xaml
    /// </summary>
    public partial class CreateQuitPlanWindow : Window
    {
        private readonly IUserService _userService = new UserService();
        private readonly IQuitPlanService _quitPlanService = new QuitPlanService();
        private readonly IReasonService _reasonService = new ReasonService(); // bạn cần tạo service này nếu chưa có
        private readonly int _userId;
        private readonly UserWindow _parentWindow;
        public CreateQuitPlanWindow(int userId, UserWindow parentWindow)
        {
            InitializeComponent();
            _userId = userId;
            _parentWindow = parentWindow;
            LoadReasons();
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            var loginWindow = new LoginWindow();
            loginWindow.Show();

            this.Close();
        }
        private void LoadReasons()
        {
            var reasons = _reasonService.GetAllReasons(); // trả về List<Reason>
            foreach (var reason in reasons)
            {
                var checkbox = new CheckBox
                {
                    Content = reason.ReasonText,
                    Tag = reason.ReasonId,
                    Margin = new Thickness(5)
                };
                ReasonCheckboxPanel.Children.Add(checkbox);
            }
        }

        private void CreatePlan_Click(object sender, RoutedEventArgs e)
        {
            var selectedReasonIds = ReasonCheckboxPanel.Children.OfType<CheckBox>()
                .Where(cb => cb.IsChecked == true)
                .Select(cb => (int)cb.Tag)
                .ToList();

            if (selectedReasonIds.Count == 0)
            {
                MessageBox.Show("Please select at least one reason.", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            var quitDate = DateOnly.FromDateTime(DateTime.Now);
            bool success = _quitPlanService.Create(_userId, quitDate, selectedReasonIds);

            if (success)
            {
                var plan = _quitPlanService.GetLatestPlanForUser(_userId);
                MessageBox.Show("Quit plan created successfully!", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                

                if (plan != null)
                {
                    var checklistWindow = new ChecklistStepWindow(plan.QuitPlanId, _userId, _parentWindow);
                    checklistWindow.Show();
                   
                }
                this.Close();
            }
            else
            {
                MessageBox.Show("Failed to create quit plan.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            _parentWindow.Show();
            this.Close();
        }
    }
}