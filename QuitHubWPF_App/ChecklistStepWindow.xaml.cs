using BusinessObject;
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
    /// Interaction logic for ChecklistStepWindow.xaml
    /// </summary>
    public partial class ChecklistStepWindow : Window
    {
        private readonly IChecklistStepService _service = new ChecklistStepService();
        private List<ChecklistStep> _steps;
        private readonly int _userId;
        private readonly int _planId;
        private readonly UserWindow _parentWindow;
        public ChecklistStepWindow(int planId, int userId, UserWindow parentWindow)
        {
            InitializeComponent();
            _parentWindow = parentWindow;
            _userId = userId;
            _planId = planId;
            ShowToday();
            LoadSteps();
           
        }
        private void RefreshChecklistByDate()
        {
            DateOnly today = DateOnly.FromDateTime(DateTime.Today);

            foreach (var step in _steps)
            {
                if (step.LastCheckedDate.HasValue && step.LastCheckedDate.Value != today)
                {
                    step.IsCompleted = false;
                    step.LastCheckedDate = null;
                    _service.UpdateStep(step);
                }
            }
        }

        private void LoadSteps()
        {
            _steps = _service.GetStepsByPlan(_planId);
            RefreshChecklistByDate();
            dgSteps.ItemsSource = _steps;
        }
        private void Save_Click(object sender, RoutedEventArgs e)
        {
            DateOnly today = DateOnly.FromDateTime(DateTime.Today);

            foreach (var step in _steps)
            {
                if (step.IsCompleted)
                {
                    step.LastCheckedDate = today;
                }
                else
                {
                    step.LastCheckedDate = null;
                }

                _service.UpdateStep(step);
            }

            MessageBox.Show("Checklist steps updated.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            _parentWindow.Show(); // mở lại UserWindow thật sự (đã có sẵn)
            this.Close();
        }
        private void ShowToday()
        {
            Title = $"Checklist for {DateTime.Today:dddd, dd MMMM yyyy}";
        }
        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }
    }
}