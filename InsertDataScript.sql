

CREATE TABLE Roles (
    RoleId INT PRIMARY KEY,
    RoleName NVARCHAR(50) NOT NULL
);


CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(200) NOT NULL,
    FullName NVARCHAR(100),
    Age INT,
    RoleId INT FOREIGN KEY REFERENCES Roles(RoleId)
);


CREATE TABLE QuitPlans (
    QuitPlanId INT PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    QuitDate DATE NOT NULL,
    CreatedAt DATETIME
);


CREATE TABLE Reasons (
    ReasonId INT PRIMARY KEY,
    ReasonText NVARCHAR(255) NOT NULL
);


CREATE TABLE UserQuitReasons (
    UserQuitReasonId INT PRIMARY KEY,
    QuitPlanId INT FOREIGN KEY REFERENCES QuitPlans(QuitPlanId),
    ReasonId INT FOREIGN KEY REFERENCES Reasons(ReasonId)
);


CREATE TABLE ChecklistSteps (
    ChecklistId INT PRIMARY KEY,
    QuitPlanId INT FOREIGN KEY REFERENCES QuitPlans(QuitPlanId),
    StepOrder INT,
    StepName NVARCHAR(255) NOT NULL,
    IsCompleted BIT,
    Note NVARCHAR(500),
    LastCheckedDate DATE
);


CREATE TABLE DailyChecklists (
    ChecklistId INT PRIMARY KEY,
    QuitPlanId INT FOREIGN KEY REFERENCES QuitPlans(QuitPlanId),
    CheckDate DATE NOT NULL,
    IsCompleted BIT,
    Note NVARCHAR(255)
);


CREATE TABLE Feedbacks (
    FeedbackId INT PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    Emoji NVARCHAR(10),
    Message NVARCHAR(500),
    SentAt DATETIME
);


CREATE TABLE FeedbackResponses (
    ResponseId INT PRIMARY KEY,
    FeedbackId INT FOREIGN KEY REFERENCES Feedbacks(FeedbackId),
    ResponderId INT FOREIGN KEY REFERENCES Users(UserId),
    ResponseText NVARCHAR(MAX),
    RespondedAt DATETIME
);


CREATE TABLE CounselingSchedules (
    ScheduleId INT PRIMARY KEY,
    UserId INT FOREIGN KEY REFERENCES Users(UserId),
    CounselorId INT FOREIGN KEY REFERENCES Users(UserId),
    ScheduleTime DATETIME NOT NULL,
    Topic NVARCHAR(255),
    IsConfirmed BIT
);


-- Insert into Roles
INSERT INTO Roles ([RoleId], [RoleName]) VALUES (1, N'User');
INSERT INTO Roles ([RoleId], [RoleName]) VALUES (2, N'Admin');
INSERT INTO Roles ([RoleId], [RoleName]) VALUES (3, N'Counselor');

-- Insert into Users
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (1, N'deborah23', N'*5NIxjf+$', N'Maureen Mendoza', 29, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (2, N'bailey08', N'_1MDy8a8Tf', N'Jessica Patrick', 51, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (3, N'joannpace', N'&o83mVsw', N'Jane Garcia', 18, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (4, N'jessica08', N'^6q0Fc7ayH', N'Brittany Moses', 50, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (5, N'smithpatrick', N's3yhYt2u(D', N'Erika Randolph', 19, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (6, N'davidlopez', N'Q&$2$xQd', N'Mr. Matthew Mckenzie', 42, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (7, N'alexandra78', N'iR6!NBu8(', N'Nancy Lewis', 53, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (8, N'michelleroberts', N'^k)g5rVv', N'Lori Thompson', 40, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (9, N'stephaniemontoya', N'^Co1wQxiG', N'Jesse Calderon', 23, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (10, N'jason03', N'!gQT2Ac7A', N'Jeremy Ferguson', 27, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (11, N'micheal75', N'$)8ZlqNQ', N'Danielle Edwards', 42, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (12, N'thomaswang', N'+58yrNFq3$', N'Sean Lawrence', 59, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (13, N'sarahwilliams', N'^4I65Rwm', N'Matthew Campbell', 23, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (14, N'perryjoe', N'@0SbHLvI', N'Michael Miller', 25, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (15, N'fwilliams', N'O!2Qrxuxt', N'Noah Gibson', 54, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (16, N'robertbowman', N'_3Nt4Nx#_', N'Mary Barton', 59, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (17, N'tammy08', N'j5&A1XKk$', N'Shannon Steele', 60, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (18, N'jeffery00', N'_3!#0V2wL', N'Tara Webb', 30, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (19, N'wolfesean', N'4B*L6dbT$3', N'James Smith', 30, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (20, N'sharon62', N'j5H%^6VlK', N'Ross Clark II', 36, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (21, N'opratt', N')Y44oLys', N'Chad Mcpherson', 59, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (22, N'nsmith', N'G!0JTxFdLo', N'Amy Miller', 42, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (23, N'mike93', N')i7hqEEQR1', N'Julia Kerr', 37, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (24, N'brenda60', N'T7^J!4QjL(', N'Deanna Robinson', 40, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (25, N'lewisnancy', N'Lv&U0Lne', N'Cody Taylor', 32, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (26, N'ljackson', N'6+5Js(FoI', N'John Arnold', 55, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (27, N'broth', N'(50HOnhtG$', N'Stephen Richmond', 27, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (28, N'evelyn51', N'bMGXfeKM^8', N'Jeffrey Frazier', 32, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (29, N'cynthiasaunders', N'+B9Hy8a)', N'Douglas Wright', 19, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (30, N'teresa07', N'^K8^pWdl', N'Andrea James', 31, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (31, N'karen25', N'Tn6YfRar#x', N'Carrie Long', 30, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (32, N'rebecca99', N'+6OIfto1ru', N'Caitlin Velez', 55, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (33, N'stacey15', N'FM%8Oi_f', N'Allison Harvey', 55, 1);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (34, N'jose72', N'_AbDvfm3&2', N'Angela Erickson', 44, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (35, N'tracyhicks', N'b@pQ63Onu', N'Anthony Harris', 56, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (36, N'hprice', N'Z(0HXGfh^g', N'Dr. Samuel Torres', 18, 3);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (37, N'lesliezimmerman', N'*)3FTjmSe', N'Kimberly Ray', 59, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (38, N'randy98', N'^@4XLzSx', N'Thomas Alvarez', 25, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (39, N'frank46', N'&mqZ1RXvjw', N'Brian Williams', 55, 2);
INSERT INTO Users ([UserId], [Username], [Password], [FullName], [Age], [RoleId]) VALUES (40, N'andrewjackson', N'(X3XXngp', N'Tyler Hall', 59, 2);

-- Insert into QuitPlans
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (1, 1, 2025-07-03, '2025-04-23 19:16:28');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (2, 2, 2025-07-17, '2025-04-22 22:00:26');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (3, 3, 2025-07-24, '2025-07-23 05:19:56');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (4, 4, 2025-07-24, '2025-02-07 11:39:21');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (5, 5, 2025-07-20, '2025-01-17 16:21:12');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (6, 6, 2025-07-24, '2025-06-05 23:43:04');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (7, 7, 2025-07-15, '2025-06-25 04:57:14');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (8, 8, 2025-07-21, '2025-06-19 22:51:50');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (9, 9, 2025-07-24, '2025-01-07 17:53:52');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (10, 10, 2025-07-24, '2025-01-16 17:56:48');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (11, 11, 2025-07-12, '2025-05-05 07:02:33');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (12, 12, 2025-07-12, '2025-03-30 17:36:42');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (13, 13, 2025-07-22, '2025-04-10 01:01:05');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (14, 14, 2025-07-23, '2025-07-16 06:06:08');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (15, 15, 2025-07-07, '2025-06-20 18:20:38');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (16, 16, 2025-07-22, '2025-02-17 00:27:18');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (17, 17, 2025-06-30, '2025-01-17 00:25:14');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (18, 18, 2025-07-03, '2025-06-17 11:11:53');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (19, 19, 2025-07-23, '2025-07-21 05:26:03');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (20, 20, 2025-07-07, '2025-01-06 22:19:25');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (21, 21, 2025-06-29, '2025-03-13 19:07:58');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (22, 22, 2025-06-29, '2025-03-05 06:45:17');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (23, 23, 2025-07-20, '2025-01-30 02:11:36');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (24, 24, 2025-07-18, '2025-02-15 21:52:04');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (25, 25, 2025-07-18, '2025-06-29 04:25:35');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (26, 26, 2025-07-18, '2025-02-11 12:17:18');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (27, 27, 2025-07-06, '2025-05-01 13:18:36');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (28, 28, 2025-07-09, '2025-01-12 10:13:59');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (29, 29, 2025-07-03, '2025-05-21 06:56:45');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (30, 30, 2025-07-02, '2025-04-16 09:16:59');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (31, 31, 2025-07-02, '2025-04-25 14:32:30');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (32, 32, 2025-07-01, '2025-06-14 19:11:40');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (33, 33, 2025-07-21, '2025-02-17 09:28:34');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (34, 34, 2025-06-30, '2025-03-16 01:23:08');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (35, 35, 2025-07-10, '2025-07-24 17:15:14');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (36, 36, 2025-07-14, '2025-05-15 10:42:44');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (37, 37, 2025-07-09, '2025-03-14 23:45:08');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (38, 38, 2025-07-19, '2025-02-17 21:45:30');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (39, 39, 2025-07-03, '2025-02-09 14:08:43');
INSERT INTO QuitPlans ([QuitPlanId], [UserId], [QuitDate], [CreatedAt]) VALUES (40, 40, 2025-07-01, '2025-05-29 14:40:53');

-- Insert into Reasons
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (1, N'Treat political radio result enjoy.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (2, N'Simply common heart despite kitchen third.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (3, N'Onto enough Mr manage home.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (4, N'Animal discover personal could.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (5, N'Determine receive event three stuff.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (6, N'Add pay approach.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (7, N'Note cold age bank.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (8, N'Able test increase.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (9, N'Probably under city individual.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (10, N'Score so show.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (11, N'Trip cost research.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (12, N'Federal early meeting allow its.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (13, N'Seat still record clear half.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (14, N'Daughter lot computer would.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (15, N'Possible other true business like call.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (16, N'Accept how color program.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (17, N'Ten put wind process seem.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (18, N'Do sometimes tree degree would coach.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (19, N'Put happy consumer.');
INSERT INTO Reasons ([ReasonId], [ReasonText]) VALUES (20, N'Professor star whole.');

-- Insert into UserQuitReasons
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (1, 1, 4);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (2, 1, 15);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (3, 2, 7);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (4, 2, 8);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (5, 3, 3);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (6, 3, 16);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (7, 4, 18);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (8, 4, 7);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (9, 5, 9);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (10, 5, 4);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (11, 6, 18);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (12, 6, 17);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (13, 7, 4);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (14, 7, 10);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (15, 8, 2);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (16, 8, 4);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (17, 9, 16);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (18, 9, 15);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (19, 10, 4);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (20, 10, 16);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (21, 11, 14);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (22, 11, 10);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (23, 12, 4);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (24, 12, 9);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (25, 13, 1);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (26, 13, 1);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (27, 14, 3);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (28, 14, 16);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (29, 15, 10);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (30, 15, 16);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (31, 16, 11);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (32, 16, 9);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (33, 17, 5);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (34, 17, 8);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (35, 18, 7);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (36, 18, 12);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (37, 19, 9);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (38, 19, 14);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (39, 20, 10);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (40, 20, 20);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (41, 21, 11);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (42, 21, 8);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (43, 22, 6);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (44, 22, 8);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (45, 23, 6);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (46, 23, 19);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (47, 24, 6);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (48, 24, 17);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (49, 25, 2);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (50, 25, 19);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (51, 26, 10);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (52, 26, 1);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (53, 27, 7);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (54, 27, 1);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (55, 28, 10);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (56, 28, 11);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (57, 29, 18);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (58, 29, 16);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (59, 30, 20);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (60, 30, 5);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (61, 31, 10);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (62, 31, 13);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (63, 32, 6);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (64, 32, 15);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (65, 33, 1);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (66, 33, 20);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (67, 34, 5);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (68, 34, 3);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (69, 35, 18);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (70, 35, 4);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (71, 36, 2);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (72, 36, 13);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (73, 37, 18);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (74, 37, 15);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (75, 38, 12);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (76, 38, 6);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (77, 39, 14);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (78, 39, 19);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (79, 40, 12);
INSERT INTO UserQuitReasons ([UserQuitReasonId], [QuitPlanId], [ReasonId]) VALUES (80, 40, 8);

-- Insert into ChecklistSteps
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (1, 1, 1, N'Step 1 for plan 1', 1, N'Fire carry avoid. Include effort interview what day positive. Fact evening protect recently blood.', 2025-03-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (2, 1, 2, N'Step 2 for plan 1', 0, N'Tree quickly fear prove three dinner.', 2025-06-26);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (3, 1, 3, N'Step 3 for plan 1', 1, N'Than loss apply out now himself. Be six western serious write when.', 2025-01-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (4, 2, 1, N'Step 1 for plan 2', 1, N'Result citizen feel science. Positive sport include PM marriage author wish.', 2025-01-25);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (5, 2, 2, N'Step 2 for plan 2', 0, N'Often concern standard medical eye trial hospital institution. Now us pattern claim better.', 2025-05-10);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (6, 2, 3, N'Step 3 for plan 2', 0, N'Once standard tough close. Skin think various standard quality until floor.', 2025-05-03);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (7, 3, 1, N'Step 1 for plan 3', 1, N'Attack save opportunity both break player. Explain according tonight physical in.', 2025-07-08);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (8, 3, 2, N'Step 2 for plan 3', 0, N'Door end resource consider. Industry fact yet focus pick affect in near.', 2025-07-11);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (9, 3, 3, N'Step 3 for plan 3', 0, N'Hospital art upon type TV suggest. Call while money decade writer.', 2025-07-11);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (10, 4, 1, N'Step 1 for plan 4', 1, N'Spring piece listen. Different to very assume up into team information.', 2025-06-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (11, 4, 2, N'Step 2 for plan 4', 0, N'Represent value be. Pm manager perform tough.', 2025-01-30);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (12, 4, 3, N'Step 3 for plan 4', 0, N'By politics quite public. Cultural of peace maybe charge when film everything.', 2025-06-10);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (13, 5, 1, N'Step 1 for plan 5', 0, N'Development old financial organization. Sea child brother small.
Him inside home traditional able.', 2025-05-02);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (14, 5, 2, N'Step 2 for plan 5', 0, N'Then decide involve way wrong affect remember series. Account check door visit many.', 2025-03-25);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (15, 5, 3, N'Step 3 for plan 5', 0, N'Rock push method politics field. Use need person indicate. Beat television baby type want without.', 2025-02-27);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (16, 6, 1, N'Step 1 for plan 6', 1, N'Wrong control imagine sing source travel most. They present expert thousand hour oil.', 2025-04-17);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (17, 6, 2, N'Step 2 for plan 6', 0, N'Late laugh strategy record plant cost field. Half sing page out reach nor region high.', 2025-07-09);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (18, 6, 3, N'Step 3 for plan 6', 1, N'Necessary upon score. Manage general drive fill beyond white.', 2025-01-30);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (19, 7, 1, N'Step 1 for plan 7', 1, N'Crime school reveal floor water although. History image me up. Book size response own available.', 2025-03-07);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (20, 7, 2, N'Step 2 for plan 7', 1, N'Surface care little make kitchen. Kind threat method.', 2025-04-09);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (21, 7, 3, N'Step 3 for plan 7', 1, N'Blood training guy.', 2025-04-02);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (22, 8, 1, N'Step 1 for plan 8', 1, N'Authority treat act late sit. Rule cover bit myself yourself business.', 2025-04-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (23, 8, 2, N'Step 2 for plan 8', 0, N'My affect follow. Scientist radio board reflect economy would property.', 2025-01-02);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (24, 8, 3, N'Step 3 for plan 8', 0, N'Energy majority oil quickly major picture matter measure.', 2025-04-25);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (25, 9, 1, N'Step 1 for plan 9', 1, N'Other beautiful sea next. Whatever book just goal. Serious identify many as he carry source show.', 2025-07-18);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (26, 9, 2, N'Step 2 for plan 9', 0, N'Put strategy tell positive political arm on. Realize argue against provide amount enter.', 2025-06-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (27, 9, 3, N'Step 3 for plan 9', 1, N'Indicate throughout different fact. Let perhaps field economic. Than adult whose third.', 2025-04-26);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (28, 10, 1, N'Step 1 for plan 10', 1, N'Page community chance artist read source edge. Mother weight write fine election result.', 2025-06-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (29, 10, 2, N'Step 2 for plan 10', 1, N'Choose street top.
In create court itself management.', 2025-05-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (30, 10, 3, N'Step 3 for plan 10', 0, N'Charge maintain prove assume guess must with. System whom compare industry.', 2025-05-08);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (31, 11, 1, N'Step 1 for plan 11', 0, N'Father girl medical as. Million job style network including thought religious.', 2025-01-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (32, 11, 2, N'Step 2 for plan 11', 0, N'Visit walk everyone join true daughter coach bill. Know compare we in remain factor season.', 2025-07-03);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (33, 11, 3, N'Step 3 for plan 11', 0, N'Capital less care mission wind. Determine decision charge. Include force behind trial task box.', 2025-02-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (34, 12, 1, N'Step 1 for plan 12', 1, N'Term fast education seem cell color. Blood sea short quite.', 2025-03-01);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (35, 12, 2, N'Step 2 for plan 12', 1, N'Born campaign allow. Raise anything why school present off main.', 2025-02-10);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (36, 12, 3, N'Step 3 for plan 12', 1, N'Move role thousand total role cut resource eye. Race wide blood season audience.', 2025-05-09);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (37, 13, 1, N'Step 1 for plan 13', 1, N'Thousand student half per. Former per though by. Law word this consumer during.', 2025-01-26);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (38, 13, 2, N'Step 2 for plan 13', 0, N'Audience east until. Bring green head card source.', 2025-04-21);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (39, 13, 3, N'Step 3 for plan 13', 1, N'Fly feeling either eye cultural office language. Manage gun second central tax.', 2025-04-20);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (40, 14, 1, N'Step 1 for plan 14', 1, N'Say process general whom security girl network do. Church perhaps draw forward society receive.', 2025-04-17);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (41, 14, 2, N'Step 2 for plan 14', 0, N'Note all same mission. Friend investment key dream better thousand Mr.
Idea school expect.', 2025-05-30);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (42, 14, 3, N'Step 3 for plan 14', 1, N'Buy hold structure probably boy. Realize street computer soldier rate.', 2025-04-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (43, 15, 1, N'Step 1 for plan 15', 1, N'Almost remember thing scientist right per. View someone expert role ready. Occur there away.', 2025-07-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (44, 15, 2, N'Step 2 for plan 15', 0, N'Where maybe show include industry buy purpose.', 2025-03-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (45, 15, 3, N'Step 3 for plan 15', 0, N'Tonight less policy life and always fine not. Real shake animal few.', 2025-02-18);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (46, 16, 1, N'Step 1 for plan 16', 0, N'Admit kitchen tonight by myself role.
Last federal travel leader only worker field.', 2025-05-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (47, 16, 2, N'Step 2 for plan 16', 1, N'Court easy hear.
Career smile style player box thus avoid. Enough price pattern show toward ago.', 2025-02-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (48, 16, 3, N'Step 3 for plan 16', 1, N'Middle provide law technology loss. Nice message author reduce fire. Source cause mention number.', 2025-02-06);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (49, 17, 1, N'Step 1 for plan 17', 0, N'Increase film middle along. Less enter effort official article.', 2025-06-05);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (50, 17, 2, N'Step 2 for plan 17', 0, N'Evening team cultural. Important mother relationship perform.', 2025-01-28);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (51, 17, 3, N'Step 3 for plan 17', 0, N'Could herself certainly assume add edge. Mission car simple firm region.', 2025-03-21);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (52, 18, 1, N'Step 1 for plan 18', 1, N'Reduce form seem in require last newspaper. Others fish he evening. Present force far American.', 2025-03-19);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (53, 18, 2, N'Step 2 for plan 18', 1, N'Individual without fight smile bad force young. International reflect one every and present.', 2025-07-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (54, 18, 3, N'Step 3 for plan 18', 0, N'Spend clear allow peace top smile foot reach. Organization fact almost system bad.', 2025-02-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (55, 19, 1, N'Step 1 for plan 19', 0, N'Benefit month now example so reason. Evening step also people rich especially discussion everyone.', 2025-04-07);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (56, 19, 2, N'Step 2 for plan 19', 0, N'Not whatever throw. Very particular age ahead.', 2025-07-19);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (57, 19, 3, N'Step 3 for plan 19', 1, N'Trial large size they however cover about. Loss where near whom nice skill strong career.', 2025-05-09);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (58, 20, 1, N'Step 1 for plan 20', 1, N'Scientist serve wide food college. Receive bill city their task leave pretty.', 2025-01-16);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (59, 20, 2, N'Step 2 for plan 20', 1, N'Offer see development particularly long even. Best among trouble hundred that dog.', 2025-04-09);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (60, 20, 3, N'Step 3 for plan 20', 0, N'Become personal accept natural.', 2025-04-04);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (61, 21, 1, N'Step 1 for plan 21', 1, N'Budget member five half impact military. Action imagine focus more. Knowledge list as style may.', 2025-03-31);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (62, 21, 2, N'Step 2 for plan 21', 0, N'Among can answer military put find. Again article future theory still crime blood.', 2025-04-21);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (63, 21, 3, N'Step 3 for plan 21', 1, N'Feeling arrive have be light father. Memory food wish while. Family list attention attack simply.', 2025-02-02);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (64, 22, 1, N'Step 1 for plan 22', 1, N'Or recent away because industry safe art. Always test court best. Few list cost expert song leave.', 2025-04-13);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (65, 22, 2, N'Step 2 for plan 22', 1, N'Mind night tough air plan lawyer goal. In analysis easy edge.', 2025-06-16);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (66, 22, 3, N'Step 3 for plan 22', 1, N'Great hand lead make.
Town truth management. Indeed action real.', 2025-06-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (67, 23, 1, N'Step 1 for plan 23', 1, N'Situation computer close describe. Artist size perhaps performance trade first.', 2025-04-30);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (68, 23, 2, N'Step 2 for plan 23', 0, N'Six fact determine nothing win thousand. Involve military dinner beyond thought peace stage what.', 2025-07-07);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (69, 23, 3, N'Step 3 for plan 23', 0, N'Meeting beat onto benefit yourself. Represent manager wish small claim well keep.', 2025-07-17);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (70, 24, 1, N'Step 1 for plan 24', 0, N'Environment beat full anything above candidate visit. Piece check policy.', 2025-05-07);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (71, 24, 2, N'Step 2 for plan 24', 0, N'Tax media act country successful. Usually author quickly.', 2025-07-10);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (72, 24, 3, N'Step 3 for plan 24', 1, N'Fire issue major determine drive. Become feeling happy yourself result realize.', 2025-06-13);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (73, 25, 1, N'Step 1 for plan 25', 1, N'People room stage note perhaps. Popular although nothing college.', 2025-07-17);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (74, 25, 2, N'Step 2 for plan 25', 0, N'Form believe special again. Dinner source discussion will make arm.', 2025-05-28);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (75, 25, 3, N'Step 3 for plan 25', 1, N'Reason ok imagine. Use go room staff allow. Final nor myself set.', 2025-07-01);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (76, 26, 1, N'Step 1 for plan 26', 0, N'Song event stage magazine tonight officer your. We significant opportunity mouth conference item.', 2025-02-15);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (77, 26, 2, N'Step 2 for plan 26', 1, N'Idea vote role Democrat suffer. Inside half position author. Writer will story painting hit course.', 2025-03-21);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (78, 26, 3, N'Step 3 for plan 26', 0, N'Old democratic however themselves not bring professional.
Although create series leader detail and.', 2025-03-28);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (79, 27, 1, N'Step 1 for plan 27', 1, N'Conference candidate set. Present manager threat idea western.', 2025-07-17);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (80, 27, 2, N'Step 2 for plan 27', 1, N'Live general civil let spend role. Bill character it across budget.', 2025-04-12);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (81, 27, 3, N'Step 3 for plan 27', 1, N'Mr describe well throughout century. Add move suddenly. Throughout skill never between apply.', 2025-03-10);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (82, 28, 1, N'Step 1 for plan 28', 1, N'Learn peace white ever. Member form executive environment issue.', 2025-02-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (83, 28, 2, N'Step 2 for plan 28', 0, N'Democratic hotel form visit girl able season glass.', 2025-04-15);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (84, 28, 3, N'Step 3 for plan 28', 0, N'Region door soldier thousand reveal. Expert fear pay trouble.', 2025-04-07);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (85, 29, 1, N'Step 1 for plan 29', 0, N'Walk friend build call choice until light. Apply blood foreign paper scene.', 2025-04-26);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (86, 29, 2, N'Step 2 for plan 29', 0, N'Social natural spend factor surface. Toward meet bad first area life ground.', 2025-03-01);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (87, 29, 3, N'Step 3 for plan 29', 0, N'Entire minute south summer add. Decision sort middle necessary likely.', 2025-03-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (88, 30, 1, N'Step 1 for plan 30', 0, N'Pressure window Mrs form information expect election. Want paper model late.', 2025-03-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (89, 30, 2, N'Step 2 for plan 30', 1, N'Five expert bag central agency. Authority every ahead magazine.', 2025-02-06);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (90, 30, 3, N'Step 3 for plan 30', 0, N'Soon major hotel population. Game alone begin bed final.', 2025-06-25);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (91, 31, 1, N'Step 1 for plan 31', 1, N'Strong other cup too not paper those. Way part above agent particular manager hit.', 2025-01-19);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (92, 31, 2, N'Step 2 for plan 31', 1, N'Than attention price light house in. Perform ability amount. Why set simply these listen after.', 2025-06-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (93, 31, 3, N'Step 3 for plan 31', 0, N'Oil factor also federal. Away sometimes that election particular color cut.', 2025-01-28);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (94, 32, 1, N'Step 1 for plan 32', 0, N'Interesting situation rest who nearly nothing. Policy reveal car something anything.', 2025-05-21);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (95, 32, 2, N'Step 2 for plan 32', 1, N'Imagine help stay work.', 2025-05-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (96, 32, 3, N'Step 3 for plan 32', 1, N'On expect fact. Matter interview notice to. Community whether have.', 2025-01-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (97, 33, 1, N'Step 1 for plan 33', 0, N'Positive very few arm. Little break anyone five size. Cold chance me star four.', 2025-07-03);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (98, 33, 2, N'Step 2 for plan 33', 0, N'Early doctor mind if. Sea focus happy political choice think.', 2025-04-10);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (99, 33, 3, N'Step 3 for plan 33', 0, N'Her pressure stop behavior fish sell price. Simple response near relationship one attack realize.', 2025-03-08);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (100, 34, 1, N'Step 1 for plan 34', 1, N'Already red rest shake. Past wish force. Remain wait probably behavior pick total.', 2025-01-27);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (101, 34, 2, N'Step 2 for plan 34', 0, N'Instead them pick public address bank.', 2025-01-06);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (102, 34, 3, N'Step 3 for plan 34', 0, N'Reflect hair condition fill lawyer right.', 2025-04-25);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (103, 35, 1, N'Step 1 for plan 35', 1, N'Heart seek give huge career event lose partner. Certain mention consumer system.', 2025-03-31);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (104, 35, 2, N'Step 2 for plan 35', 1, N'Kid crime model economy nature move understand.', 2025-03-09);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (105, 35, 3, N'Step 3 for plan 35', 1, N'Friend natural off report unit poor civil. Learn billion report investment day participant.', 2025-01-23);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (106, 36, 1, N'Step 1 for plan 36', 0, N'Kitchen late smile watch before popular those. Former condition ability skin.', 2025-05-19);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (107, 36, 2, N'Step 2 for plan 36', 0, N'Body later statement street allow different. Speak would visit protect write name peace season.', 2025-01-02);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (108, 36, 3, N'Step 3 for plan 36', 1, N'Mean whatever knowledge. Involve be suffer company who.
Election responsibility key shoulder.', 2025-01-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (109, 37, 1, N'Step 1 for plan 37', 0, N'Mr police happen understand thought score. Today east keep minute subject why.', 2025-06-23);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (110, 37, 2, N'Step 2 for plan 37', 0, N'Life religious compare ever get. Tree deep baby rule for direction.', 2025-04-22);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (111, 37, 3, N'Step 3 for plan 37', 1, N'Such cultural some ready decision ahead so. Management recently successful into effort suffer he.', 2025-07-03);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (112, 38, 1, N'Step 1 for plan 38', 0, N'Experience small against suffer so floor staff.', 2025-07-13);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (113, 38, 2, N'Step 2 for plan 38', 0, N'Ball election reflect official live. Easy who data statement board agent decide.', 2025-02-20);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (114, 38, 3, N'Step 3 for plan 38', 1, N'Wide when court none manager without to. Something yes develop deep herself.', 2025-04-15);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (115, 39, 1, N'Step 1 for plan 39', 1, N'Education popular yeah team.
Physical them reason significant account. More long still speak.', 2025-02-18);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (116, 39, 2, N'Step 2 for plan 39', 0, N'Design head professor message look anything.', 2025-03-14);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (117, 39, 3, N'Step 3 for plan 39', 0, N'Behavior especially statement kid ask include grow.', 2025-06-15);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (118, 40, 1, N'Step 1 for plan 40', 0, N'Share walk president mouth. Hear staff reason up.
Everything former same might some player.', 2025-06-24);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (119, 40, 2, N'Step 2 for plan 40', 1, N'Put tough first white. Positive these maintain sister herself seek such bed.', 2025-04-10);
INSERT INTO ChecklistSteps ([ChecklistId], [QuitPlanId], [StepOrder], [StepName], [IsCompleted], [Note], [LastCheckedDate]) VALUES (120, 40, 3, N'Step 3 for plan 40', 1, N'Matter mention opportunity put raise expert. Save red soon.
Third seem man maybe box.', 2025-02-20);

-- Insert into DailyChecklists
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (1, 1, 2025-05-16, 1, N'Decade take leave suffer career entire main.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (2, 1, 2025-06-20, 0, N'Great practice suggest song the.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (3, 1, 2025-06-01, 1, N'Benefit deal anyone.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (4, 2, 2025-06-09, 1, N'Defense just two type everybody study others.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (5, 2, 2025-03-24, 1, N'Protect use firm important.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (6, 2, 2025-03-29, 1, N'Skill several store worry.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (7, 3, 2025-04-11, 0, N'Major standard international pay fill.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (8, 3, 2025-02-01, 0, N'Before situation growth six.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (9, 3, 2025-06-30, 1, N'Hard control represent green.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (10, 4, 2025-05-27, 1, N'Great indicate road site happen yet available oil.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (11, 4, 2025-02-01, 0, N'Loss religious member own charge against stand.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (12, 4, 2025-06-19, 1, N'Huge space here within else meeting network.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (13, 5, 2025-02-27, 1, N'Foreign soldier drop vote so first child.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (14, 5, 2025-01-24, 1, N'Personal vote lawyer pull cost total piece.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (15, 5, 2025-04-01, 1, N'Nothing politics state majority area would.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (16, 6, 2025-01-27, 1, N'Piece will degree model.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (17, 6, 2025-02-23, 0, N'Probably especially need wish city.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (18, 6, 2025-06-22, 1, N'Our reduce each anyone born magazine.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (19, 7, 2025-04-14, 0, N'Too thing support future moment.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (20, 7, 2025-03-18, 0, N'Although television owner also happy.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (21, 7, 2025-07-02, 0, N'Pick city herself cup concern.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (22, 8, 2025-03-15, 1, N'Sometimes condition thank face.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (23, 8, 2025-04-25, 1, N'Personal full whose candidate save pretty.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (24, 8, 2025-03-13, 0, N'High street morning significant stop sell degree.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (25, 9, 2025-07-08, 1, N'Final rule case leader wait maybe such notice.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (26, 9, 2025-06-30, 0, N'Executive first leave goal recently also part.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (27, 9, 2025-01-13, 1, N'Help stand wall.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (28, 10, 2025-02-17, 1, N'Democratic thus production suffer whether born.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (29, 10, 2025-07-24, 1, N'Center ready among.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (30, 10, 2025-01-20, 1, N'Out require interview summer daughter around make behavior.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (31, 11, 2025-03-25, 0, N'Test serve rock whether indicate often.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (32, 11, 2025-04-26, 1, N'Recently product use cost.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (33, 11, 2025-04-14, 0, N'Ahead day watch game learn.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (34, 12, 2025-04-16, 0, N'Whatever expect watch series memory born happen.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (35, 12, 2025-03-03, 0, N'Look spend arm million share finish.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (36, 12, 2025-03-14, 0, N'Toward public after rock know research Congress.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (37, 13, 2025-04-03, 0, N'Market close hotel figure region value point.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (38, 13, 2025-01-28, 0, N'Behavior nice so before store kind.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (39, 13, 2025-03-01, 0, N'My free teacher pretty may executive pick.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (40, 14, 2025-01-26, 1, N'Question themselves case age space.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (41, 14, 2025-06-24, 0, N'Safe its structure.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (42, 14, 2025-07-20, 1, N'Many effort model.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (43, 15, 2025-05-04, 1, N'Mother fact often go hot recognize.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (44, 15, 2025-02-08, 0, N'May range situation sense fill modern little.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (45, 15, 2025-07-25, 1, N'Lot foot according tough mind a.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (46, 16, 2025-04-12, 0, N'Democratic with feel with government buy.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (47, 16, 2025-07-25, 0, N'Individual hand nature future.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (48, 16, 2025-02-01, 0, N'Industry rather career key student participant society.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (49, 17, 2025-05-04, 1, N'Officer dark well others.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (50, 17, 2025-05-21, 0, N'For hold another leave mouth while.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (51, 17, 2025-01-19, 0, N'Instead popular general cell arm fire travel.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (52, 18, 2025-01-03, 0, N'Pull exist catch out beat important.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (53, 18, 2025-04-28, 1, N'Create wish sometimes catch product reality whether.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (54, 18, 2025-02-06, 0, N'Feeling begin month be hotel.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (55, 19, 2025-07-13, 0, N'Her live eye skill big pay.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (56, 19, 2025-02-08, 1, N'Picture whom behavior type model man social decide.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (57, 19, 2025-01-22, 1, N'Get note plan place present according.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (58, 20, 2025-02-04, 0, N'Perhaps term recent cultural soldier government.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (59, 20, 2025-05-18, 0, N'Name fish prepare.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (60, 20, 2025-02-07, 0, N'Imagine technology his above against.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (61, 21, 2025-05-18, 0, N'Open price foot war maybe set could.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (62, 21, 2025-02-22, 0, N'Argue moment dinner star.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (63, 21, 2025-05-26, 0, N'Politics consumer maybe Mrs.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (64, 22, 2025-02-22, 0, N'War century involve pay quite interview my some.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (65, 22, 2025-07-17, 0, N'Would total cultural down cost.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (66, 22, 2025-01-20, 0, N'Beautiful actually recognize per author.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (67, 23, 2025-06-09, 0, N'Nothing into assume easy hot property purpose.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (68, 23, 2025-05-30, 0, N'Style south notice interview letter since evidence.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (69, 23, 2025-01-29, 1, N'Space minute possible fire democratic strong.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (70, 24, 2025-04-02, 0, N'Key close mission hotel fall owner consumer.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (71, 24, 2025-06-25, 1, N'Indeed bad number huge road call well.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (72, 24, 2025-02-21, 1, N'Reflect church control wind month finally.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (73, 25, 2025-07-10, 1, N'Product thing speak bill rest any.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (74, 25, 2025-04-21, 1, N'Majority wear if note third.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (75, 25, 2025-05-29, 0, N'Month college seat short argue.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (76, 26, 2025-06-19, 0, N'History reality operation can recent fact.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (77, 26, 2025-02-17, 1, N'Accept any three I bag.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (78, 26, 2025-04-29, 1, N'Song letter analysis perform reflect itself continue if.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (79, 27, 2025-01-21, 1, N'Investment history may authority property mouth.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (80, 27, 2025-03-11, 0, N'Remember medical door through threat away main.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (81, 27, 2025-07-10, 1, N'Detail his Mr whom body catch at.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (82, 28, 2025-02-15, 1, N'Relate interview phone represent reason pick develop.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (83, 28, 2025-01-06, 0, N'Value fly religious song record little skin fill.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (84, 28, 2025-06-13, 1, N'Science think main he floor your.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (85, 29, 2025-06-29, 0, N'Pm would ground special policy adult soon.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (86, 29, 2025-03-05, 1, N'Form maybe meeting forward gas.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (87, 29, 2025-03-14, 0, N'Money behavior call how laugh wrong green yeah.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (88, 30, 2025-02-20, 1, N'Already deep so information.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (89, 30, 2025-01-06, 0, N'Sport your this full claim amount left.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (90, 30, 2025-05-13, 0, N'People six old author.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (91, 31, 2025-02-13, 1, N'Game lose get seem system generation.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (92, 31, 2025-02-01, 1, N'Scientist name exactly short begin stuff bed.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (93, 31, 2025-01-30, 1, N'Appear man writer.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (94, 32, 2025-01-21, 0, N'Morning worker walk break half.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (95, 32, 2025-02-07, 1, N'Smile American short early.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (96, 32, 2025-06-25, 0, N'Author professor important not yet tree.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (97, 33, 2025-01-17, 0, N'Age easy growth institution professional.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (98, 33, 2025-03-27, 1, N'Reduce democratic follow describe.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (99, 33, 2025-01-12, 0, N'Trade feel former with seem bring.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (100, 34, 2025-04-10, 1, N'View senior money you from memory.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (101, 34, 2025-07-20, 1, N'Skill explain civil require soon give.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (102, 34, 2025-02-06, 1, N'Day think performance be debate bad.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (103, 35, 2025-06-20, 0, N'History manager local prevent bag realize.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (104, 35, 2025-04-03, 1, N'Couple which contain assume often.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (105, 35, 2025-05-30, 1, N'Child single a.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (106, 36, 2025-04-14, 1, N'Success job attack do recent everything.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (107, 36, 2025-06-13, 1, N'Instead should it design six.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (108, 36, 2025-06-30, 0, N'Once rather remember stock certain.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (109, 37, 2025-02-25, 1, N'Stand to east yeah respond.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (110, 37, 2025-02-12, 0, N'About would learn perform cell company at.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (111, 37, 2025-05-06, 0, N'Party member information town ready.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (112, 38, 2025-04-19, 1, N'Return idea late wall great he.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (113, 38, 2025-03-21, 1, N'Term them could coach price mind.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (114, 38, 2025-03-16, 1, N'Ago American knowledge front.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (115, 39, 2025-05-01, 1, N'Situation consider attorney full eight billion wonder.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (116, 39, 2025-04-30, 1, N'Dinner season trial protect various read through.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (117, 39, 2025-07-05, 1, N'Hear firm final.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (118, 40, 2025-07-25, 1, N'Several television light right raise light.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (119, 40, 2025-02-13, 1, N'Drive thought several.');
INSERT INTO DailyChecklists ([ChecklistId], [QuitPlanId], [CheckDate], [IsCompleted], [Note]) VALUES (120, 40, 2025-04-04, 1, N'Act guy edge human through.');

-- Insert into Feedbacks
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (1, 1, N'😭', N'Step various positive former Democrat eat father.', '2025-07-09 19:47:00');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (2, 2, N'😭', N'Daughter child movement order on law reflect.', '2025-01-24 16:26:24');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (3, 3, N'😐', N'Receive right choose administration system its color Mr sister resource.', '2025-03-22 04:26:09');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (4, 4, N'😭', N'Those tough fly five but kitchen official officer source condition.', '2025-07-10 19:09:04');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (5, 5, N'😐', N'Hotel herself between your begin quickly perform late town station property.', '2025-01-06 14:02:36');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (6, 6, N'😐', N'Measure prepare attack enter democratic marriage year matter allow people.', '2025-03-08 23:01:09');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (7, 7, N'😀', N'Both within continue collection policy then third across also.', '2025-01-12 10:49:07');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (8, 8, N'😭', N'Similar without team rock ok old watch within forward while movie fine memory.', '2025-06-06 00:21:12');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (9, 9, N'😭', N'Authority note here media side somebody myself may tell affect.', '2025-06-22 01:36:17');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (10, 10, N'😐', N'Republican because stand former sure this best prevent short when note.', '2025-06-29 05:47:10');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (11, 11, N'😐', N'Beautiful bag bill number American star security hear.', '2025-03-04 13:36:16');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (12, 12, N'😡', N'Can score way why together school require store end rest teacher.', '2025-07-11 18:09:13');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (13, 13, N'😭', N'More hit sound nothing policy station paper enjoy way charge language on.', '2025-06-27 21:59:12');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (14, 14, N'😐', N'Even tough final off result big TV watch modern sea marriage such I.', '2025-05-03 00:39:14');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (15, 15, N'😐', N'Film notice scientist stop down collection while cost group speak seek.', '2025-03-24 09:49:21');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (16, 16, N'😭', N'Network structure military body clear own several Mr game.', '2025-03-04 10:20:26');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (17, 17, N'😡', N'Yet play piece education young writer civil indeed.', '2025-07-11 12:42:34');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (18, 18, N'😐', N'Adult himself including force term raise development community site focus.', '2025-06-01 23:42:48');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (19, 19, N'😐', N'Within quickly according conference against ability.', '2025-01-03 20:47:26');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (20, 20, N'😐', N'Increase interview generation place white win.', '2025-05-27 10:04:12');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (21, 21, N'😞', N'Rise stand standard significant until middle third item bill believe fine determine mother.', '2025-02-14 06:38:37');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (22, 22, N'😐', N'Newspaper play consider identify coach of mind.', '2025-07-08 10:25:16');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (23, 23, N'😀', N'Mention recognize clearly beyond suddenly page population effort much clear campaign few tough.', '2025-05-21 19:58:59');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (24, 24, N'😐', N'Body example fund threat talk defense word operation sometimes hotel condition back.', '2025-04-14 09:32:19');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (25, 25, N'😡', N'Idea make for different east only.', '2025-01-29 01:39:46');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (26, 26, N'😭', N'Radio west close major physical behind.', '2025-04-30 22:38:22');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (27, 27, N'😀', N'Ago to poor garden choose what total safe reach.', '2025-01-07 05:27:23');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (28, 28, N'😐', N'Her including kind prepare imagine eye somebody condition authority animal book son.', '2025-05-29 23:48:22');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (29, 29, N'😀', N'Until public community ability anyone successful culture would two.', '2025-03-19 10:42:06');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (30, 30, N'😞', N'Indicate party group region carry score.', '2025-01-16 22:08:49');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (31, 31, N'😭', N'Effort move Republican traditional enough well magazine style body my house trip test clearly.', '2025-03-01 01:46:27');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (32, 32, N'😭', N'Behind season student however room consumer us risk the.', '2025-04-17 20:49:43');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (33, 33, N'😡', N'Including tough trouble peace age should financial anyone without head turn similar sure.', '2025-06-13 06:28:19');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (34, 34, N'😀', N'Partner line cultural table mother before democratic either realize director letter.', '2025-06-11 14:12:14');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (35, 35, N'😡', N'Thank various raise world church between environmental from.', '2025-05-18 13:05:40');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (36, 36, N'😭', N'Knowledge such describe ask report within entire society hand suffer poor goal.', '2025-03-13 04:03:18');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (37, 37, N'😭', N'Reality again me indeed east actually return girl have.', '2025-03-21 20:31:42');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (38, 38, N'😐', N'Consumer little improve painting water national thousand try again modern different personal.', '2025-01-26 00:50:16');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (39, 39, N'😡', N'Standard lose type newspaper west ten design around see not whom.', '2025-04-09 09:55:34');
INSERT INTO Feedbacks ([FeedbackId], [UserId], [Emoji], [Message], [SentAt]) VALUES (40, 40, N'😡', N'Method suddenly computer bank purpose machine financial poor decade.', '2025-06-29 08:33:05');

-- Insert into FeedbackResponses
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (1, 1, 40, N'Family necessary number true board world hit worker.', '2025-01-29 08:12:28');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (2, 2, 18, N'Across some computer purpose real likely truth physical growth half thus.', '2025-04-25 19:02:48');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (3, 3, 30, N'Wide along ask green once or democratic law finally.', '2025-07-24 11:47:29');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (4, 4, 17, N'Scientist no yourself increase we three task win low goal commercial.', '2025-01-03 16:57:57');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (5, 5, 28, N'Tend the red team guess surface poor major either sure night Mr.', '2025-07-26 00:39:14');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (6, 6, 26, N'We we would affect kind security already series.', '2025-02-04 15:35:21');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (7, 7, 4, N'Physical red lot help professional speech help who item happy amount oil which.', '2025-05-06 20:46:57');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (8, 8, 32, N'Face position thousand within so wall television.', '2025-04-13 02:50:22');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (9, 9, 35, N'Product sing level nice capital factor chance alone realize lead game behavior speak week wear have.', '2025-04-25 12:00:47');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (10, 10, 16, N'Ever firm even fill herself produce professional only how should phone during office indicate show through.', '2025-04-23 00:56:25');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (11, 11, 16, N'Open art crime despite majority manager heart race data the age enjoy believe paper give.', '2025-01-28 05:30:13');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (12, 12, 25, N'Either Mr action walk wish down hear consider face hour guy within woman big professor person.', '2025-04-28 12:53:07');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (13, 13, 40, N'Point ask evidence green guy skill sort into part usually activity together.', '2025-06-09 00:00:55');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (14, 14, 5, N'Almost girl I part through day key as scientist beautiful.', '2025-05-08 11:45:03');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (15, 15, 26, N'Everybody significant change attack happen wonder follow point make generation marriage edge pattern election.', '2025-06-17 16:41:31');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (16, 16, 16, N'Would forward start charge American house difficult fire although seem bank late ten.', '2025-06-23 16:59:39');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (17, 17, 40, N'Newspaper baby fear threat young spring what five today itself sit community by push friend.', '2025-05-20 04:54:56');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (18, 18, 35, N'Others head office her economic country improve suddenly box worker sign church establish look down.', '2025-05-27 04:28:53');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (19, 19, 27, N'End meet billion wall style court none report this watch fast there.', '2025-02-24 20:24:40');
INSERT INTO FeedbackResponses ([ResponseId], [FeedbackId], [ResponderId], [ResponseText], [RespondedAt]) VALUES (20, 20, 17, N'Interesting by hour word sure nor author yeah.', '2025-06-22 04:58:29');

-- Insert into CounselingSchedules
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (1, 1, 20, '2025-04-25 21:22:46', N'Fact reflect early late speak show.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (2, 2, 12, '2025-02-04 01:47:19', N'Talk coach far morning.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (3, 3, 1, '2025-01-22 06:07:45', N'Oil trouble tend begin.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (4, 4, 21, '2025-01-02 09:15:48', N'Job us shake.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (5, 5, 8, '2025-07-14 13:30:51', N'He southern my mention manage mention.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (6, 6, 2, '2025-01-16 08:06:23', N'Former staff rule morning consider operation.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (7, 7, 14, '2025-01-30 15:24:00', N'Field dog coach we.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (8, 8, 20, '2025-04-20 20:50:59', N'Public take prepare front color between.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (9, 9, 6, '2025-01-04 01:03:01', N'Front card degree.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (10, 10, 8, '2025-02-17 06:27:58', N'Sit home series.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (11, 11, 14, '2025-07-24 23:09:16', N'Beyond final later house stuff special.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (12, 12, 7, '2025-07-20 02:19:52', N'Environment black health role list.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (13, 13, 8, '2025-07-20 06:47:42', N'Month dinner happy model enjoy.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (14, 14, 8, '2025-06-13 15:45:32', N'Interview our return agree forget.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (15, 15, 12, '2025-05-04 18:06:24', N'Follow rich week hour now.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (16, 16, 23, '2025-07-17 21:19:05', N'Kid deal note season someone.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (17, 17, 36, '2025-05-06 22:05:39', N'Same agreement at building.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (18, 18, 24, '2025-07-18 04:27:39', N'Task break station today research all.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (19, 19, 36, '2025-02-24 18:19:28', N'Work also ball drive scientist.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (20, 20, 7, '2025-05-14 08:18:27', N'Another structure discuss hotel behind only.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (21, 21, 8, '2025-03-03 00:00:01', N'Station run usually gun place.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (22, 22, 6, '2025-03-23 13:36:36', N'Coach large enter truth play year help.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (23, 23, 23, '2025-04-20 08:24:40', N'Even describe produce interesting often.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (24, 24, 21, '2025-01-24 15:27:10', N'Until sound his cultural.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (25, 25, 8, '2025-02-01 05:05:04', N'Attorney side front cup game same.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (26, 26, 19, '2025-07-25 06:20:25', N'Positive information grow TV.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (27, 27, 8, '2025-02-04 06:45:02', N'I under sea collection word.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (28, 28, 6, '2025-06-22 13:17:38', N'Recent pressure end provide source.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (29, 29, 19, '2025-05-02 12:25:26', N'Measure fund American strong hold.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (30, 30, 19, '2025-03-27 20:45:45', N'Soldier main in.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (31, 31, 36, '2025-05-24 15:23:12', N'Agree good how although perhaps more.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (32, 32, 24, '2025-07-17 10:19:04', N'Agent reduce military.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (33, 33, 23, '2025-06-26 12:43:13', N'Put feeling rather.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (34, 34, 20, '2025-01-06 22:51:46', N'Baby choose mission blue bar.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (35, 35, 2, '2025-04-18 09:14:57', N'Project miss life Democrat research front.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (36, 36, 20, '2025-03-20 10:04:13', N'Full plant minute career hour stand.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (37, 37, 6, '2025-03-06 13:32:36', N'Data not fast pass.', 1);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (38, 38, 20, '2025-02-26 22:59:41', N'First interest player fact call these.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (39, 39, 6, '2025-03-06 11:32:56', N'Full American the.', 0);
INSERT INTO CounselingSchedules ([ScheduleId], [UserId], [CounselorId], [ScheduleTime], [Topic], [IsConfirmed]) VALUES (40, 40, 1, '2025-07-05 20:30:12', N'Lay measure catch.', 0);

