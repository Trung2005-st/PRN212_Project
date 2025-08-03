using BusinessObject;
using System.Windows;

namespace QuitHubWPF_App
{
    public partial class FeedbackResponseWindow : Window
    {
        public FeedbackResponseWindow(FeedbackResponse response)
        {
            InitializeComponent();

            txtResponse.Text = response.ResponseText;
            txtDate.Text = $"🕒 {response.RespondedAt:dd-MM-yyyy HH:mm} (Admin ID: {response.ResponderId})";
        }

        private void Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
