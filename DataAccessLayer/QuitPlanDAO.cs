using BusinessObject;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class QuitPlanDAO
    {
        public bool Create(int userId, DateOnly quitDate, List<int> selectedReasonIds)
        {
            try
            {
                using (var context = new Prn212ProjectDbContext())
                {
                    // 1. Tạo plan
                    var plan = new QuitPlan
                    {
                        UserId = userId,
                        QuitDate = quitDate,
                        CreatedAt = DateTime.Now
                    };
                    context.QuitPlans.Add(plan);
                    context.SaveChanges();

                    // 2. Lưu reason đã chọn
                    foreach (var reasonId in selectedReasonIds)
                    {
                        context.UserQuitReasons.Add(new UserQuitReason
                        {
                            QuitPlanId = plan.QuitPlanId,
                            ReasonId = reasonId
                        });
                    }

                    // 3. Gắn các ChecklistSteps theo reason
                    int order = 1;
                    foreach (var reasonId in selectedReasonIds)
                    {
                        var steps = GetChecklistStepsForReason(reasonId);
                        foreach (var stepText in steps)
                        {
                            context.ChecklistSteps.Add(new ChecklistStep
                            {
                                QuitPlanId = plan.QuitPlanId,
                                StepOrder = order++,
                                StepName = stepText,
                                IsCompleted = false,
                                Note = ""
                            });
                        }
                    }

                    context.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("CreateQuitPlan error: " + ex.Message);
                return false;
            }
        }
        private List<string> GetChecklistStepsForReason(int reasonId)
        {
            return reasonId switch
            {
                1 => new List<string>
        {
            "Lên danh sách các vấn đề sức khỏe bạn đang gặp",
            "Tìm hiểu lợi ích sức khỏe khi bỏ thuốc",
            "Thực hiện bài kiểm tra sức khoẻ định kỳ",
            "Tham gia nhóm hỗ trợ về sức khỏe",
            "Lên lịch khám bác sĩ hô hấp"
        },
                2 => new List<string>
        {
            "Tâm sự với gia đình về quyết định bỏ thuốc",
            "Thiết lập quy định không hút thuốc tại nhà",
            "Tìm cách bảo vệ người thân khỏi khói thuốc",
            "Chia sẻ với con cái về tác hại của thuốc lá",
            "Lên kế hoạch dành thời gian chất lượng cho gia đình"
        },
                3 => new List<string>
        {
            "Tính toán chi phí thuốc lá mỗi tháng",
            "Lập mục tiêu tiết kiệm cụ thể",
            "Tạo bảng theo dõi tài chính bỏ thuốc",
            "Xem lại cách dùng tiền cho bản thân/sở thích",
            "Lên kế hoạch sử dụng khoản tiền tiết kiệm"
        },
                4 => new List<string>
        {
            "Vệ sinh nhà cửa, loại bỏ mùi khói thuốc",
            "Vứt bỏ gạt tàn, bật lửa, bao thuốc",
            "Chuẩn bị sẵn kẹo cao su/mint thay thế",
            "Giặt giũ quần áo thường mặc khi hút thuốc",
            "Thử sử dụng nước hoa/body spray mỗi ngày"
        },
                5 => new List<string>
        {
            "Trở thành tấm gương cho bạn bè/người thân",
            "Chia sẻ hành trình bỏ thuốc với người khác",
            "Khuyến khích người thân cùng tham gia",
            "Đăng ký tham gia sự kiện truyền thông",
            "Ghi nhật ký mỗi ngày để tự soi chiếu bản thân"
        },
                6 => new List<string>
        {
            "Tìm hiểu các bệnh liên quan đến thuốc lá",
            "So sánh nguy cơ mắc bệnh của người hút thuốc",
            "Xem các video tài liệu về tác hại thuốc lá",
            "Ghi lại những điều đáng sợ bạn biết về thuốc",
            "Tìm bác sĩ chuyên môn để tư vấn bỏ thuốc"
        },
                7 => new List<string>
        {
            "Ghi nhận sự khác biệt khi không hút thuốc",
            "Lên kế hoạch tập luyện thể thao đều đặn",
            "Theo dõi giấc ngủ và năng lượng hằng ngày",
            "Cập nhật trạng thái cơ thể vào nhật ký sức khỏe",
            "Đánh giá hiệu quả sau mỗi 1 tuần bỏ thuốc"
        },
                8 => new List<string>
        {
            "Tập bài thở sâu mỗi sáng",
            "Tránh không gian nhiều khói bụi",
            "Tìm hiểu kỹ thuật thiền/thư giãn",
            "Tham gia lớp yoga hoặc thể dục nhẹ",
            "Thực hiện bài đo phổi tại nhà"
        },
                _ => new List<string> { "Hành động mặc định – cập nhật lý do!" }
            };
        }
        public QuitPlan? GetLatestPlanForUser(int userId)
        {
            using (var context = new Prn212ProjectDbContext())
            {
                return context.QuitPlans
                    .Where(p => p.UserId == userId)
                    .OrderByDescending(p => p.CreatedAt)
                    .FirstOrDefault();
            }
        }
        public List<QuitPlan> GetPlansByUser(int userId)
        {
            using (var context = new Prn212ProjectDbContext())
            {
                return context.QuitPlans
                    .Where(p => p.UserId == userId)
                    .Include(p => p.UserQuitReasons)
                        .ThenInclude(ur => ur.Reason)
                    .OrderByDescending(p => p.CreatedAt)
                    .ToList();
            }
        }

    }
}
