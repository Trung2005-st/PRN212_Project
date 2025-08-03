using BusinessObject;
using System.Collections.Generic;
using System.Linq;
using System.Windows;

namespace QuitHubWPF_App
{
    public partial class PlanHistoryWindow : Window
    {
        public PlanHistoryWindow(List<AdminPlanView> plans)
        {
            InitializeComponent();

            // Dùng ItemsSource trực tiếp vì Reasons/Steps đã là List<string>
            dgHistory.ItemsSource = plans;
        }

        private void Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}