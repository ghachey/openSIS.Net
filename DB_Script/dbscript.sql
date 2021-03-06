USE [opensisv2]
GO
/****** Object:  Table [dbo].[course_block_schedule]    Script Date: 05/04/2021 8:22:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_block_schedule](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[grade_scale_id] [int] NULL,
	[serial] [int] NOT NULL,
	[block_id] [int] NULL,
	[period_id] [int] NULL,
	[room_id] [int] NULL,
	[take_attendance] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_course_block_schedule_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC,
	[serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_calendar_schedule]    Script Date: 05/04/2021 8:22:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_calendar_schedule](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[grade_scale_id] [int] NULL,
	[serial] [int] NOT NULL,
	[date] [date] NULL,
	[block_id] [int] NULL,
	[period_id] [int] NULL,
	[room_id] [int] NULL,
	[take_attendance] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_course_calendar_schedule_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC,
	[serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_fixed_schedule]    Script Date: 05/04/2021 8:22:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_fixed_schedule](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[grade_scale_id] [int] NULL,
	[serial] [int] NOT NULL,
	[room_id] [int] NULL,
	[block_id] [int] NULL,
	[period_id] [int] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_course_fixed_schedule_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC,
	[serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_title] [varchar](max) NULL,
	[course_short_name] [varchar](50) NULL,
	[course_grade_level] [varchar](50) NULL,
	[course_program] [varchar](100) NULL,
	[course_subject] [varchar](100) NULL,
	[course_category] [varchar](8) NULL,
	[credit_hours] [float] NULL,
	[standard] [varchar](50) NULL,
	[standard_ref_no] [varchar](50) NULL,
	[course_description] [varchar](max) NULL,
	[is_course_active] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_course] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_variable_schedule]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_variable_schedule](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[grade_scale_id] [int] NULL,
	[serial] [int] NOT NULL,
	[day] [varchar](15) NULL,
	[block_id] [int] NULL,
	[period_id] [int] NULL,
	[room_id] [int] NULL,
	[take_attendance] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_course_variable_schedule_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC,
	[serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_section]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_section](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[grade_scale_id] [int] NULL,
	[grade_scale_type] [varchar](13) NULL,
	[course_section_name] [varchar](200) NULL,
	[calendar_id] [int] NULL,
	[attendance_category_id] [int] NULL,
	[credit_hours] [decimal](8, 2) NULL,
	[seats] [int] NULL,
	[allow_student_conflict] [bit] NULL,
	[allow_teacher_conflict] [bit] NULL,
	[is_weighted_course] [bit] NULL,
	[affects_class_rank] [bit] NULL,
	[affects_honor_roll] [bit] NULL,
	[online_class_room] [bit] NULL,
	[online_classroom_url] [varchar](250) NULL,
	[online_classroom_password] [varchar](20) NULL,
	[use_standards] [bit] NULL,
	[standard_grade_scale_id] [int] NULL,
	[duration_based_on_period] [bit] NULL,
	[yr_marking_period_id] [int] NULL,
	[smstr_marking_period_id] [int] NULL,
	[qtr_marking_period_id] [int] NULL,
	[duration_start_date] [date] NULL,
	[duration_end_date] [date] NULL,
	[schedule_type] [varchar](25) NULL,
	[meeting_days] [varchar](100) NULL,
	[attendance_taken] [bit] NULL,
	[is_active] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_course_section_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[all_course_section_view]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[all_course_section_view]
AS
SELECT dbo.course.tenant_id, dbo.course.school_id, dbo.course.course_id, dbo.course.course_title, dbo.course.course_subject, dbo.course.course_program, dbo.course_section.academic_year, dbo.course_section.course_section_id, 
						 dbo.course_section.course_section_name, dbo.course_section.seats, dbo.course_section.duration_start_date, dbo.course_section.duration_end_date, dbo.course_section.yr_marking_period_id, 
						 dbo.course_section.qtr_marking_period_id, dbo.course_section.smstr_marking_period_id, dbo.course_section.schedule_type, dbo.course_section.meeting_days AS fixed_days, 
						 dbo.course_fixed_schedule.room_id AS fixed_room_id, dbo.course_fixed_schedule.period_id AS fixed_period_id, dbo.course_variable_schedule.day AS var_day, dbo.course_variable_schedule.period_id AS var_period_id, 
						 dbo.course_variable_schedule.room_id AS var_room_id, dbo.course_calendar_schedule.date AS cal_date, dbo.course_calendar_schedule.period_id AS cal_period_id, dbo.course_calendar_schedule.room_id AS cal_room_id, 
						 dbo.course_block_schedule.period_id AS block_period_id, dbo.course_block_schedule.room_id AS block_room_id, dbo.course_section.is_active
FROM  dbo.course INNER JOIN
						 dbo.course_section ON dbo.course.tenant_id = dbo.course_section.tenant_id AND dbo.course.school_id = dbo.course_section.school_id AND dbo.course.course_id = dbo.course_section.course_id LEFT OUTER JOIN
						 dbo.course_fixed_schedule ON dbo.course_section.tenant_id = dbo.course_fixed_schedule.tenant_id AND dbo.course_section.school_id = dbo.course_fixed_schedule.school_id AND 
						 dbo.course_section.course_id = dbo.course_fixed_schedule.course_id AND dbo.course_section.course_section_id = dbo.course_fixed_schedule.course_section_id LEFT OUTER JOIN
						 dbo.course_variable_schedule ON dbo.course_section.tenant_id = dbo.course_variable_schedule.tenant_id AND dbo.course_section.school_id = dbo.course_variable_schedule.school_id AND 
						 dbo.course_section.course_id = dbo.course_variable_schedule.course_id AND dbo.course_section.course_section_id = dbo.course_variable_schedule.course_section_id LEFT OUTER JOIN
						 dbo.course_calendar_schedule ON dbo.course_section.tenant_id = dbo.course_calendar_schedule.tenant_id AND dbo.course_section.school_id = dbo.course_calendar_schedule.school_id AND 
						 dbo.course_section.course_id = dbo.course_calendar_schedule.course_id AND dbo.course_section.course_section_id = dbo.course_calendar_schedule.course_section_id LEFT OUTER JOIN
						 dbo.course_block_schedule ON dbo.course_section.tenant_id = dbo.course_block_schedule.tenant_id AND dbo.course_section.school_id = dbo.course_block_schedule.school_id AND 
						 dbo.course_section.course_id = dbo.course_block_schedule.course_id AND dbo.course_section.course_section_id = dbo.course_block_schedule.course_section_id
GO
/****** Object:  Table [dbo].[attendance_code]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance_code](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[attendance_category_id] [int] NOT NULL,
	[attendance_code] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[title] [varchar](100) NULL,
	[short_name] [varchar](10) NULL,
	[type] [varchar](10) NULL,
	[state_code] [varchar](8) NULL,
	[default_code] [bit] NULL,
	[allow_entry_by] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_attendance_code] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[attendance_category_id] ASC,
	[attendance_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendance_code_categories]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance_code_categories](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[attendance_category_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[title] [varchar](150) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_attendance_code_categories] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[attendance_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[block]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[block](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[block_id] [int] NOT NULL,
	[block_title] [varchar](200) NULL,
	[block_sort_order] [bigint] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_block] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[block_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[block_period]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[block_period](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[block_id] [int] NOT NULL,
	[period_id] [int] NOT NULL,
	[period_title] [varchar](200) NULL,
	[period_short_name] [varchar](50) NULL,
	[period_start_time] [char](8) NULL,
	[period_end_time] [char](8) NULL,
	[period_sort_order] [int] NULL,
	[calculate_attendance] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_block_period] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[block_id] ASC,
	[period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calendar_events]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calendar_events](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[calendar_id] [int] NOT NULL,
	[event_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[school_date] [date] NULL,
	[title] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[visible_to_membership_id] [varchar](30) NULL,
	[event_color] [varchar](7) NULL,
	[system_wide_event] [bit] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_calendar_events] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[calendar_id] ASC,
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[stateid] [int] NULL,
	[created_by] [varchar](100) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[countrycode] [varchar](5) NULL,
	[created_by] [varchar](100) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_country_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_standard]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_standard](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[standard_ref_no] [varchar](50) NOT NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_course_standard] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[course_id] ASC,
	[standard_ref_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[custom_fields]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custom_fields](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[field_id] [int] NOT NULL,
	[module] [char](10) NOT NULL,
	[type] [varchar](50) NULL,
	[search] [bit] NULL,
	[title] [varchar](30) NULL,
	[sort_order] [int] NULL,
	[select_options] [varchar](max) NULL,
	[system_field] [bit] NULL,
	[required] [bit] NULL,
	[default_selection] [varchar](100) NULL,
	[hide] [bit] NULL,
	[last_update] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_custom_fields] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[category_id] ASC,
	[field_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[custom_fields_value]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custom_fields_value](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[field_id] [int] NOT NULL,
	[target_id] [int] NOT NULL,
	[module] [char](10) NOT NULL,
	[custom_field_title] [varchar](30) NULL,
	[custom_field_type] [varchar](50) NULL,
	[custom_field_value] [varchar](max) NULL,
	[last_update] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_custom_fields_value] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[category_id] ASC,
	[field_id] ASC,
	[target_id] ASC,
	[module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpdown_valuelist]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpdown_valuelist](
	[id] [bigint] NOT NULL,
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[lov_name] [varchar](50) NOT NULL,
	[lov_column_value] [varchar](max) NOT NULL,
	[created_by] [varchar](100) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_dpdown_valuelist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[effort_grade_library_category]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[effort_grade_library_category](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[effort_category_id] [int] NOT NULL,
	[category_name] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_effort_category] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[effort_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[effort_grade_library_category_item]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[effort_grade_library_category_item](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[effort_category_id] [int] NOT NULL,
	[effort_item_id] [int] NOT NULL,
	[effort_item_title] [int] NULL,
	[sort_order] [int] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_effort_category_item] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[effort_category_id] ASC,
	[effort_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[effort_grade_scale]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[effort_grade_scale](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[effort_grade_scale_id] [int] NOT NULL,
	[grade_scale_value] [int] NULL,
	[grade_scale_comment] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_effort_grade_scale] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[effort_grade_scale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fields_category]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fields_category](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[is_system_category] [bit] NULL,
	[search] [bit] NULL,
	[title] [varchar](50) NULL,
	[module] [char](10) NULL,
	[sort_order] [int] NULL,
	[required] [bit] NULL,
	[hide] [bit] NULL,
	[last_update] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_custom_category] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[grade_scale_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
	[title] [varchar](max) NULL,
	[breakoff] [int] NULL,
	[weighted_gp_value] [decimal](5, 2) NULL,
	[unweighted_gp_value] [decimal](5, 2) NULL,
	[comment] [varchar](max) NULL,
	[sort_order] [int] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_grade] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[grade_scale_id] ASC,
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade_age_range]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade_age_range](
	[age_range_id] [int] NOT NULL,
	[age_range] [varchar](10) NULL,
 CONSTRAINT [PK_grade_age_range] PRIMARY KEY CLUSTERED 
(
	[age_range_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade_educational_stage]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade_educational_stage](
	[isced_code] [int] NOT NULL,
	[educational_stage] [varchar](250) NULL,
 CONSTRAINT [PK_grade_educational_stage] PRIMARY KEY CLUSTERED 
(
	[isced_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade_equivalency]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade_equivalency](
	[equivalency_id] [int] NOT NULL,
	[Grade_Level_Equivalency] [varchar](250) NOT NULL,
 CONSTRAINT [PK_grade_equivalency_1] PRIMARY KEY CLUSTERED 
(
	[equivalency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade_scale]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade_scale](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[grade_scale_id] [int] NOT NULL,
	[grade_scale_name] [varchar](100) NULL,
	[grade_scale_value] [decimal](5, 2) NULL,
	[grade_scale_comment] [varchar](max) NULL,
	[calculate_gpa] [bit] NULL,
	[use_as_standard_grade_scale] [bit] NULL,
	[sort_order] [int] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_grade_scale] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[grade_scale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade_us_standard]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade_us_standard](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[standard_ref_no] [varchar](50) NOT NULL,
	[grade_standard_id] [int] NULL,
	[grade_level] [varchar](50) NULL,
	[domain] [varchar](100) NULL,
	[subject] [char](50) NULL,
	[course] [varchar](100) NULL,
	[topic] [varchar](max) NULL,
	[standard_details] [varchar](max) NULL,
	[is_school_specific] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_grade_us_standard] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[standard_ref_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gradelevels]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gradelevels](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
	[short_name] [varchar](5) NULL,
	[title] [varchar](50) NULL,
	[equivalency_id] [int] NULL,
	[age_range_id] [int] NULL,
	[isced_code] [int] NULL,
	[next_grade_id] [int] NULL,
	[sort_order] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_gradelevels] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[honor_rolls]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[honor_rolls](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[marking_period_id] [int] NOT NULL,
	[honor_roll_id] [int] NOT NULL,
	[honor_roll] [varchar](20) NULL,
	[breakoff] [int] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_honor_rolls] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[honor_roll_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[language]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[language](
	[lang_id] [int] NOT NULL,
	[lcid] [nchar](10) NULL,
	[locale] [nchar](50) NULL,
	[language_code] [nchar](10) NULL,
	[created_by] [varchar](100) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [pk_table_language] PRIMARY KEY CLUSTERED 
(
	[lang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membership]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membership](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[membership_id] [int] NOT NULL,
	[profile] [varchar](30) NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_system] [bit] NULL,
	[is_superadmin] [bit] NULL,
	[profile_type] [varchar](50) NULL,
	[description] [varchar](250) NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [pk_table_membership_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[membership_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notice]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notice](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[notice_id] [int] NOT NULL,
	[target_membership_ids] [varchar](50) NOT NULL,
	[title] [varchar](max) NOT NULL,
	[body] [varchar](max) NOT NULL,
	[valid_from] [date] NOT NULL,
	[valid_to] [date] NOT NULL,
	[isactive] [bit] NOT NULL,
	[created_by] [varchar](100) NOT NULL,
	[created_time] [datetime] NOT NULL,
 CONSTRAINT [pk_table_notice] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[notice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parent_address]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parent_address](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[student_address_same] [bit] NOT NULL,
	[address_line_one] [varchar](200) NULL,
	[address_line_two] [varchar](200) NULL,
	[country] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[zip] [varchar](20) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_parent_address_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[parent_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parent_associationship]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parent_associationship](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[associationship] [bit] NOT NULL,
	[relationship] [varchar](30) NULL,
	[is_custodian] [bit] NULL,
	[contact_type] [varchar](9) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_parent_associationship] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[parent_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parent_info]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parent_info](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[parent_guid] [uniqueidentifier] NOT NULL,
	[parent_photo] [varbinary](max) NULL,
	[salutation] [varchar](20) NULL,
	[firstname] [varchar](50) NULL,
	[middlename] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[home_phone] [varchar](30) NULL,
	[work_phone] [varchar](30) NULL,
	[mobile] [varchar](30) NULL,
	[personal_email] [varchar](150) NULL,
	[work_email] [varchar](150) NULL,
	[user_profile] [varchar](50) NULL,
	[is_portal_user] [bit] NOT NULL,
	[login_email] [varchar](150) NULL,
	[suffix] [varchar](20) NULL,
	[bus_no] [varchar](15) NULL,
	[bus_pickup] [bit] NULL,
	[bus_dropoff] [bit] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_parent_info_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission_category]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission_category](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[permission_category_id] [int] NOT NULL,
	[permission_group_id] [int] NOT NULL,
	[permission_category_name] [varchar](50) NULL,
	[short_code] [varchar](50) NULL,
	[path] [varchar](255) NULL,
	[title] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[enable_view] [bit] NULL,
	[enable_add] [bit] NULL,
	[enable_edit] [bit] NULL,
	[enable_delete] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_permission_category_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[permission_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission_group]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission_group](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[permission_group_id] [int] NOT NULL,
	[permission_group_name] [varchar](50) NULL,
	[short_name] [varchar](50) NULL,
	[is_active] [bit] NULL,
	[is_system] [bit] NOT NULL,
	[title] [varchar](50) NULL,
	[icon] [varchar](50) NULL,
	[icon_type] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[type] [varchar](50) NULL,
	[path] [varchar](255) NULL,
	[badgeType] [varchar](50) NULL,
	[badgeValue] [varchar](50) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_permission_group] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[permission_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission_subcategory]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission_subcategory](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[permission_category_id] [int] NOT NULL,
	[permission_subcategory_id] [int] NOT NULL,
	[permission_group_id] [int] NOT NULL,
	[permission_subcategory_name] [varchar](50) NULL,
	[short_code] [varchar](50) NULL,
	[path] [varchar](255) NULL,
	[title] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[enable_view] [bit] NULL,
	[enable_add] [bit] NULL,
	[enable_edit] [bit] NULL,
	[enable_delete] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_permission_subcategory_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[permission_subcategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plans]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plans](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[plan_id] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[max_api_checks] [int] NULL,
	[features] [varbinary](max) NULL,
 CONSTRAINT [pk_table_plans] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programs](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[program_id] [int] NOT NULL,
	[program_name] [varchar](100) NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_programs] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[program_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[progress_periods]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[progress_periods](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[marking_period_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NOT NULL,
	[quarter_id] [int] NOT NULL,
	[title] [varchar](50) NULL,
	[short_name] [varchar](10) NULL,
	[sort_order] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[post_start_date] [date] NULL,
	[post_end_date] [date] NULL,
	[does_grades] [bit] NULL,
	[does_exam] [bit] NULL,
	[does_comments] [bit] NULL,
	[rollover_id] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_progress_periods] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[marking_period_id] ASC,
	[academic_year] ASC,
	[quarter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quarters]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quarters](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[marking_period_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[semester_id] [int] NULL,
	[title] [varchar](50) NULL,
	[short_name] [varchar](10) NULL,
	[sort_order] [decimal](10, 0) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[post_start_date] [date] NULL,
	[post_end_date] [date] NULL,
	[does_grades] [bit] NULL,
	[does_exam] [bit] NULL,
	[does_comments] [bit] NULL,
	[rollover_id] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_quarters] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[marking_period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[release_number]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[release_number](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[release_number] [varchar](9) NOT NULL,
	[release_date] [date] NOT NULL,
 CONSTRAINT [PK_release_number] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[release_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_permission]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permission](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[role_permission_id] [int] NOT NULL,
	[membership_id] [int] NULL,
	[permission_group_id] [int] NULL,
	[permission_category_id] [int] NULL,
	[permission_subcategory_id] [int] NULL,
	[can_view] [bit] NULL,
	[can_add] [bit] NULL,
	[can_edit] [bit] NULL,
	[can_delete] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_role_permission] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[role_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[title] [varchar](100) NULL,
	[capacity] [int] NULL,
	[description] [text] NULL,
	[sort_order] [int] NULL,
	[isactive] [bit] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_rooms] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_calendars]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_calendars](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[calender_id] [int] NOT NULL,
	[title] [varchar](50) NULL,
	[academic_year] [decimal](4, 0) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[visible_to_membership_id] [varchar](50) NULL,
	[default_calender] [bit] NULL,
	[days] [varchar](7) NULL,
	[rollover_id] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_school_calendars] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[calender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_detail]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_detail](
	[id] [int] NOT NULL,
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NULL,
	[affiliation] [nchar](100) NULL,
	[associations] [nchar](100) NULL,
	[locale] [nchar](100) NULL,
	[lowest_grade_level] [nchar](100) NULL,
	[highest_grade_level] [nchar](100) NULL,
	[date_school_opened] [date] NULL,
	[date_school_closed] [date] NULL,
	[status] [bit] NULL,
	[gender] [char](15) NULL,
	[internet] [bit] NOT NULL,
	[electricity] [bit] NULL,
	[telephone] [nchar](20) NULL,
	[fax] [nchar](20) NULL,
	[website] [nchar](150) NULL,
	[email] [nchar](100) NULL,
	[twitter] [nchar](100) NULL,
	[facebook] [nchar](100) NULL,
	[instagram] [nchar](100) NULL,
	[youtube] [nchar](100) NULL,
	[linkedin] [nchar](100) NULL,
	[name_of_principal] [nchar](100) NULL,
	[name_of_assistant_principal] [nchar](100) NULL,
	[school_logo] [varbinary](max) NULL,
	[running_water] [bit] NULL,
	[main_source_of_drinking_water] [nchar](100) NULL,
	[currently_available] [bit] NULL,
	[female_toilet_type] [nchar](50) NULL,
	[total_female_toilets] [smallint] NULL,
	[total_female_toilets_usable] [smallint] NULL,
	[female_toilet_accessibility] [nchar](50) NULL,
	[male_toilet_type] [nchar](50) NULL,
	[total_male_toilets] [smallint] NULL,
	[total_male_toilets_usable] [smallint] NULL,
	[male_toilet_accessibility] [nchar](50) NULL,
	[comon_toilet_type] [nchar](50) NULL,
	[total_common_toilets] [smallint] NULL,
	[total_common_toilets_usable] [smallint] NULL,
	[common_toilet_accessibility] [nchar](50) NULL,
	[handwashing_available] [bit] NULL,
	[soap_and_water_available] [bit] NULL,
	[hygene_education] [nchar](50) NULL,
 CONSTRAINT [pk_table_school_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_master]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_master](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[school_guid] [uniqueidentifier] NOT NULL,
	[school_internal_id] [varchar](50) NULL,
	[school_alt_id] [char](50) NULL,
	[school_state_id] [char](10) NULL,
	[school_district_id] [nchar](50) NULL,
	[school_level] [nchar](50) NULL,
	[school_classification] [nchar](50) NULL,
	[school_name] [nvarchar](100) NULL,
	[alternate_name] [nvarchar](100) NULL,
	[street_address_1] [nvarchar](150) NULL,
	[street_address_2] [nvarchar](150) NULL,
	[city] [char](50) NULL,
	[county] [char](50) NULL,
	[division] [char](50) NULL,
	[state] [char](50) NULL,
	[district] [char](50) NULL,
	[zip] [nchar](20) NULL,
	[country] [char](50) NULL,
	[current_period_ends] [datetime] NULL,
	[max_api_checks] [int] NULL,
	[features] [varchar](max) NULL,
	[plan_id] [int] NULL,
	[created_by] [char](50) NULL,
	[date_created] [datetime] NULL,
	[modified_by] [char](50) NULL,
	[date_modifed] [datetime] NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
 CONSTRAINT [pk_table_school_master] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_periods_obsolete]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_periods_obsolete](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[period_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[sort_order] [int] NULL,
	[title] [varchar](100) NULL,
	[short_name] [varchar](10) NULL,
	[length] [decimal](10, 0) NULL,
	[block] [varchar](10) NULL,
	[ignore_scheduling] [varchar](10) NULL,
	[attendance] [bit] NULL,
	[rollover_id] [int] NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_school_periods] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[school_years]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school_years](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[marking_period_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[title] [varchar](50) NULL,
	[short_name] [varchar](10) NULL,
	[sort_order] [decimal](10, 0) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[post_start_date] [date] NULL,
	[post_end_date] [date] NULL,
	[does_grades] [bit] NULL,
	[does_exam] [bit] NULL,
	[does_comments] [bit] NULL,
	[rollover_id] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_school_years] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[marking_period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[search_filter]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_filter](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[module] [char](15) NOT NULL,
	[filter_id] [int] NOT NULL,
	[filter_name] [char](50) NULL,
	[emailaddress] [varchar](150) NULL,
	[json_list] [varchar](max) NULL,
	[created_by] [char](50) NULL,
	[date_created] [datetime] NULL,
	[modified_by] [char](50) NULL,
	[date_modifed] [datetime] NULL,
 CONSTRAINT [PK_search_filter] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[module] ASC,
	[filter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sections]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sections](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[section_id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[sort_order] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_sections] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semesters]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semesters](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[marking_period_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[year_id] [int] NULL,
	[title] [varchar](50) NULL,
	[short_name] [varchar](10) NULL,
	[sort_order] [decimal](10, 0) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[post_start_date] [date] NULL,
	[post_end_date] [date] NULL,
	[does_grades] [bit] NULL,
	[does_exam] [bit] NULL,
	[does_comments] [bit] NULL,
	[rollover_id] [decimal](10, 0) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_table_semesters] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[marking_period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_certificate_info]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_certificate_info](
	[id] [int] NOT NULL,
	[tenant_id] [uniqueidentifier] NULL,
	[school_id] [int] NULL,
	[staff_id] [int] NULL,
	[certification_name] [varchar](150) NULL,
	[short_name] [varchar](50) NULL,
	[certification_code] [varchar](20) NULL,
	[primary_certification] [bit] NULL,
	[certification_date] [date] NULL,
	[certification_expiry_date] [date] NULL,
	[certification_description] [varchar](max) NULL,
	[updated_by] [varchar](100) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_staff_certificate_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_coursesection_schedule]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_coursesection_schedule](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[staff_guid] [uniqueidentifier] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[course_section_name] [varchar](200) NULL,
	[yr_marking_period_id] [int] NULL,
	[smstr_marking_period_id] [int] NULL,
	[qtr_marking_period_id] [int] NULL,
	[duration_start_date] [date] NULL,
	[duration_end_date] [date] NULL,
	[meeting_days] [varchar](100) NULL,
	[is_dropped] [bit] NULL,
	[effective_drop_date] [datetime] NULL,
	[is_assigned] [bit] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NOT NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_staff_coursesection_schedule] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[staff_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_master]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_master](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[staff_guid] [uniqueidentifier] NOT NULL,
	[staff_photo] [varbinary](max) NULL,
	[salutation] [varchar](50) NULL,
	[suffix] [varchar](50) NULL,
	[first_given_name] [varchar](50) NULL,
	[middle_name] [varchar](50) NULL,
	[last_family_name] [varchar](50) NULL,
	[staff_internal_id] [varchar](50) NULL,
	[alternate_id] [varchar](50) NULL,
	[district_id] [varchar](50) NULL,
	[state_id] [varchar](50) NULL,
	[preferred_name] [varchar](50) NULL,
	[previous_name] [varchar](50) NULL,
	[social_security_number] [varchar](50) NULL,
	[other_govt_issued_number] [varchar](50) NULL,
	[gender] [varchar](6) NULL,
	[race] [varchar](50) NULL,
	[ethnicity] [varchar](50) NULL,
	[dob] [date] NULL,
	[marital_status] [varchar](10) NULL,
	[country_of_birth] [int] NULL,
	[nationality] [int] NULL,
	[first_language] [int] NULL,
	[second_language] [int] NULL,
	[third_language] [int] NULL,
	[physical_disability] [bit] NULL,
	[portal_access] [bit] NULL,
	[login_email_address] [varchar](150) NULL,
	[profile] [varchar](50) NULL,
	[job_title] [varchar](50) NULL,
	[joining_date] [date] NULL,
	[end_date] [date] NULL,
	[homeroom_teacher] [bit] NULL,
	[primary_grade_level_taught] [varchar](50) NULL,
	[primary_subject_taught] [varchar](50) NULL,
	[other_grade_level_taught] [varchar](50) NULL,
	[other_subject_taught] [varchar](50) NULL,
	[home_phone] [varchar](30) NULL,
	[mobile_phone] [varchar](30) NULL,
	[office_phone] [varchar](30) NULL,
	[personal_email] [varchar](max) NULL,
	[school_email] [varchar](max) NULL,
	[twitter] [varchar](max) NULL,
	[facebook] [varchar](max) NULL,
	[instagram] [varchar](max) NULL,
	[youtube] [varchar](max) NULL,
	[linkedin] [varchar](max) NULL,
	[home_address_line_one] [varchar](200) NULL,
	[home_address_line_two] [varchar](200) NULL,
	[home_address_city] [varchar](50) NULL,
	[home_address_state] [varchar](50) NULL,
	[home_address_country] [varchar](50) NULL,
	[home_address_zip] [varchar](30) NULL,
	[mailing_address_same_to_home] [bit] NULL,
	[mailing_address_line_one] [varchar](200) NULL,
	[mailing_address_line_two] [varchar](200) NULL,
	[mailing_address_city] [varchar](50) NULL,
	[mailing_address_state] [varchar](50) NULL,
	[mailing_address_country] [varchar](50) NULL,
	[mailing_address_zip] [varchar](30) NULL,
	[emergency_first_name] [varchar](50) NULL,
	[emergency_last_name] [varchar](50) NULL,
	[relationship_to_staff] [varchar](50) NULL,
	[emergency_home_phone] [varchar](30) NULL,
	[emergency_work_phone] [varchar](30) NULL,
	[emergency_mobile_phone] [varchar](30) NULL,
	[emergency_email] [varchar](150) NULL,
	[disability_description] [varchar](200) NULL,
	[bus_no] [varchar](15) NULL,
	[bus_pickup] [bit] NULL,
	[bus_dropoff] [bit] NULL,
	[last_updated_by] [varchar](100) NULL,
	[last_updated] [datetime] NULL,
 CONSTRAINT [PK_staff_master_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_schedule_view]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_schedule_view](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_short_name] [varchar](50) NULL,
	[course_section_id] [int] NOT NULL,
	[course_section_name] [varchar](200) NULL,
	[staff_internal_id] [varchar](50) NULL,
	[staff_name] [varchar](250) NULL,
	[scheduled] [bit] NOT NULL,
	[conflict_comment] [varchar](300) NULL,
 CONSTRAINT [PK_staff_schedule_view] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[staff_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_school_info]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_school_info](
	[id] [int] NOT NULL,
	[tenant_id] [uniqueidentifier] NULL,
	[school_id] [int] NULL,
	[staff_id] [int] NULL,
	[school_attached_id] [int] NULL,
	[school_attached_name] [varchar](100) NULL,
	[profile] [varchar](50) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[updated_by] [varchar](100) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_staff_school_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[countryid] [int] NULL,
	[created_by] [varchar](100) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [pk_statemaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_comments]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_comments](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[comment_id] [int] NOT NULL,
	[comment] [varchar](max) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_student_comments] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_coursesection_schedule]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_coursesection_schedule](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[student_guid] [uniqueidentifier] NOT NULL,
	[alternate_id] [varchar](50) NULL,
	[student_internal_id] [varchar](50) NULL,
	[first_given_name] [varchar](50) NOT NULL,
	[middle_name] [varchar](50) NULL,
	[last_family_name] [varchar](50) NOT NULL,
	[first_language_id] [int] NOT NULL,
	[grade_id] [int] NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NOT NULL,
	[grade_scale_id] [int] NULL,
	[course_section_name] [varchar](200) NULL,
	[calendar_id] [int] NULL,
	[is_dropped] [bit] NULL,
	[effective_drop_date] [datetime] NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_student_coursesection_schedule] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_documents]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_documents](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[document_id] [int] NOT NULL,
	[filename] [varchar](100) NULL,
	[filetype] [varchar](100) NULL,
	[file_uploaded] [varbinary](max) NULL,
	[uploaded_on] [datetime] NULL,
	[uploaded_by] [varchar](100) NULL,
 CONSTRAINT [PK_student_documents] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[document_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_enrollment]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_enrollment](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[enrollment_id] [int] NOT NULL,
	[student_guid] [uniqueidentifier] NOT NULL,
	[calender_id] [int] NULL,
	[rolling_option] [varchar](50) NULL,
	[school_name] [varchar](200) NULL,
	[grade_id] [int] NULL,
	[grade_level_title] [varchar](50) NULL,
	[enrollment_date] [date] NULL,
	[enrollment_code] [varchar](50) NULL,
	[exit_date] [date] NULL,
	[exit_code] [varchar](50) NULL,
	[transferred_school_id] [int] NULL,
	[is_active] [bit] NULL,
	[school_transferred] [varchar](200) NULL,
	[transferred_grade] [varchar](50) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_student_enrollment] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_enrollment_code]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_enrollment_code](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[enrollment_code] [int] NOT NULL,
	[academic_year] [decimal](4, 0) NULL,
	[title] [varchar](100) NULL,
	[short_name] [nchar](10) NULL,
	[sort_order] [int] NULL,
	[type] [varchar](20) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_student_enrollment_codes] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[enrollment_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_master]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_master](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[student_guid] [uniqueidentifier] NOT NULL,
	[student_internal_id] [varchar](50) NULL,
	[alternate_id] [varchar](50) NULL,
	[district_id] [varchar](50) NULL,
	[state_id] [varchar](50) NULL,
	[admission_number] [varchar](50) NULL,
	[roll_number] [varchar](50) NULL,
	[salutation] [varchar](50) NULL,
	[first_given_name] [varchar](50) NULL,
	[middle_name] [varchar](50) NULL,
	[last_family_name] [varchar](50) NULL,
	[suffix] [varchar](50) NULL,
	[preferred_name] [varchar](50) NULL,
	[previous_name] [varchar](50) NULL,
	[social_security_number] [varchar](50) NULL,
	[other_govt_issued_number] [varchar](50) NULL,
	[student_photo] [varbinary](max) NULL,
	[dob] [date] NULL,
	[student_portal_id] [varchar](50) NULL,
	[gender] [varchar](6) NULL,
	[race] [varchar](50) NULL,
	[ethnicity] [varchar](50) NULL,
	[marital_status] [varchar](10) NULL,
	[country_of_birth] [int] NULL,
	[nationality] [int] NULL,
	[first_language_id] [int] NULL,
	[second_language_id] [int] NULL,
	[third_language_id] [int] NULL,
	[section_id] [int] NULL,
	[estimated_grad_date] [date] NULL,
	[eligibility_504] [bit] NULL,
	[economic_disadvantage] [bit] NULL,
	[free_lunch_eligibility] [bit] NULL,
	[special_education_indicator] [bit] NULL,
	[lep_indicator] [bit] NULL,
	[home_phone] [varchar](30) NULL,
	[mobile_phone] [varchar](30) NULL,
	[personal_email] [varchar](max) NULL,
	[school_email] [varchar](max) NULL,
	[twitter] [varchar](max) NULL,
	[facebook] [varchar](max) NULL,
	[instagram] [varchar](max) NULL,
	[youtube] [varchar](max) NULL,
	[linkedin] [varchar](max) NULL,
	[home_address_line_one] [varchar](200) NULL,
	[home_address_line_two] [varchar](200) NULL,
	[home_address_city] [varchar](50) NULL,
	[home_address_state] [varchar](50) NULL,
	[home_address_country] [varchar](50) NULL,
	[home_address_zip] [varchar](20) NULL,
	[bus_no] [varchar](15) NULL,
	[school_bus_pick_up] [bit] NULL,
	[school_bus_drop_off] [bit] NULL,
	[mailing_address_same_to_home] [bit] NULL,
	[mailing_address_line_one] [varchar](200) NULL,
	[mailing_address_line_two] [varchar](200) NULL,
	[mailing_address_city] [varchar](50) NULL,
	[mailing_address_state] [varchar](50) NULL,
	[mailing_address_country] [varchar](50) NULL,
	[mailing_address_zip] [varchar](20) NULL,
	[critical_alert] [varchar](200) NULL,
	[alert_description] [varchar](max) NULL,
	[primary_care_physician] [varchar](200) NULL,
	[primary_care_physician_phone] [varchar](50) NULL,
	[medical_facility] [varchar](100) NULL,
	[medical_facility_phone] [varchar](50) NULL,
	[insurance_company] [varchar](200) NULL,
	[insurance_company_phone] [varchar](50) NULL,
	[policy_number] [varchar](50) NULL,
	[policy_holder] [varchar](100) NULL,
	[dentist] [varchar](100) NULL,
	[dentist_phone] [varchar](50) NULL,
	[vision] [varchar](100) NULL,
	[vision_phone] [varchar](50) NULL,
	[associationship] [varchar](max) NULL,
	[enrollment_type] [char](8) NULL,
	[is_active] [bit] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_student_master_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_schedule_view]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_schedule_view](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_section_id] [int] NOT NULL,
	[student_internal_id] [varchar](50) NULL,
	[student_name] [varchar](250) NULL,
	[scheduled] [bit] NOT NULL,
	[conflict_comment] [varchar](300) NULL,
 CONSTRAINT [PK_stutent_schedule_view] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[course_id] ASC,
	[course_section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[subject_name] [varchar](100) NULL,
	[created_by] [varchar](150) NULL,
	[created_on] [datetime] NULL,
	[updated_by] [varchar](150) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_master]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_master](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[emailaddress] [varchar](150) NOT NULL,
	[passwordhash] [varchar](256) NOT NULL,
	[lang_id] [int] NOT NULL,
	[membership_id] [int] NOT NULL,
	[is_active] [bit] NULL,
	[description] [varchar](250) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_user_master_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[emailaddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_secret_questions]    Script Date: 05/04/2021 8:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_secret_questions](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[emailaddress] [varchar](150) NOT NULL,
	[user_id] [int] NULL,
	[movie] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[hero] [varchar](100) NULL,
	[book] [varchar](100) NULL,
	[cartoon] [varchar](100) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_user_secret_questions] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[emailaddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user_master] ADD  CONSTRAINT [DF_Table_User_Master_lang_id]  DEFAULT ((1)) FOR [lang_id]
GO
ALTER TABLE [dbo].[attendance_code]  WITH CHECK ADD  CONSTRAINT [FK_attendance_code_attendance_code_categories] FOREIGN KEY([tenant_id], [school_id], [attendance_category_id])
REFERENCES [dbo].[attendance_code_categories] ([tenant_id], [school_id], [attendance_category_id])
GO
ALTER TABLE [dbo].[attendance_code] CHECK CONSTRAINT [FK_attendance_code_attendance_code_categories]
GO
ALTER TABLE [dbo].[attendance_code_categories]  WITH CHECK ADD  CONSTRAINT [FK_attendance_code_categories_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[attendance_code_categories] CHECK CONSTRAINT [FK_attendance_code_categories_school_master]
GO
ALTER TABLE [dbo].[block]  WITH CHECK ADD  CONSTRAINT [FK_block_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[block] CHECK CONSTRAINT [FK_block_school_master]
GO
ALTER TABLE [dbo].[block_period]  WITH CHECK ADD  CONSTRAINT [FK_block_period_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[block_period] CHECK CONSTRAINT [FK_block_period_school_master]
GO
ALTER TABLE [dbo].[city]  WITH NOCHECK ADD  CONSTRAINT [FK_city_state] FOREIGN KEY([id])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_state]
GO
ALTER TABLE [dbo].[course_block_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_block_schedule_block] FOREIGN KEY([tenant_id], [school_id], [block_id])
REFERENCES [dbo].[block] ([tenant_id], [school_id], [block_id])
GO
ALTER TABLE [dbo].[course_block_schedule] CHECK CONSTRAINT [FK_course_block_schedule_block]
GO
ALTER TABLE [dbo].[course_block_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_block_schedule_block_periods] FOREIGN KEY([tenant_id], [school_id], [block_id], [period_id])
REFERENCES [dbo].[block_period] ([tenant_id], [school_id], [block_id], [period_id])
GO
ALTER TABLE [dbo].[course_block_schedule] CHECK CONSTRAINT [FK_course_block_schedule_block_periods]
GO
ALTER TABLE [dbo].[course_block_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_block_schedule_rooms] FOREIGN KEY([tenant_id], [school_id], [room_id])
REFERENCES [dbo].[rooms] ([tenant_id], [school_id], [room_id])
GO
ALTER TABLE [dbo].[course_block_schedule] CHECK CONSTRAINT [FK_course_block_schedule_rooms]
GO
ALTER TABLE [dbo].[course_calendar_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_calendar_schedule_block_periods] FOREIGN KEY([tenant_id], [school_id], [block_id], [period_id])
REFERENCES [dbo].[block_period] ([tenant_id], [school_id], [block_id], [period_id])
GO
ALTER TABLE [dbo].[course_calendar_schedule] CHECK CONSTRAINT [FK_course_calendar_schedule_block_periods]
GO
ALTER TABLE [dbo].[course_calendar_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_calendar_schedule_rooms] FOREIGN KEY([tenant_id], [school_id], [room_id])
REFERENCES [dbo].[rooms] ([tenant_id], [school_id], [room_id])
GO
ALTER TABLE [dbo].[course_calendar_schedule] CHECK CONSTRAINT [FK_course_calendar_schedule_rooms]
GO
ALTER TABLE [dbo].[course_fixed_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_fixed_schedule_block_periods] FOREIGN KEY([tenant_id], [school_id], [block_id], [period_id])
REFERENCES [dbo].[block_period] ([tenant_id], [school_id], [block_id], [period_id])
GO
ALTER TABLE [dbo].[course_fixed_schedule] CHECK CONSTRAINT [FK_course_fixed_schedule_block_periods]
GO
ALTER TABLE [dbo].[course_fixed_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_fixed_schedule_rooms] FOREIGN KEY([tenant_id], [school_id], [room_id])
REFERENCES [dbo].[rooms] ([tenant_id], [school_id], [room_id])
GO
ALTER TABLE [dbo].[course_fixed_schedule] CHECK CONSTRAINT [FK_course_fixed_schedule_rooms]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_attendance_code_categories] FOREIGN KEY([tenant_id], [school_id], [attendance_category_id])
REFERENCES [dbo].[attendance_code_categories] ([tenant_id], [school_id], [attendance_category_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_attendance_code_categories]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_course] FOREIGN KEY([tenant_id], [school_id], [course_id])
REFERENCES [dbo].[course] ([tenant_id], [school_id], [course_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_course]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_grade_scale] FOREIGN KEY([tenant_id], [school_id], [grade_scale_id])
REFERENCES [dbo].[grade_scale] ([tenant_id], [school_id], [grade_scale_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_grade_scale]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_quarters] FOREIGN KEY([tenant_id], [school_id], [qtr_marking_period_id])
REFERENCES [dbo].[quarters] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_quarters]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_school_calendars] FOREIGN KEY([tenant_id], [school_id], [calendar_id])
REFERENCES [dbo].[school_calendars] ([tenant_id], [school_id], [calender_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_school_calendars]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_school_master]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_school_years] FOREIGN KEY([tenant_id], [school_id], [yr_marking_period_id])
REFERENCES [dbo].[school_years] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_school_years]
GO
ALTER TABLE [dbo].[course_section]  WITH CHECK ADD  CONSTRAINT [FK_course_section_semesters] FOREIGN KEY([tenant_id], [school_id], [smstr_marking_period_id])
REFERENCES [dbo].[semesters] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[course_section] CHECK CONSTRAINT [FK_course_section_semesters]
GO
ALTER TABLE [dbo].[course_standard]  WITH CHECK ADD  CONSTRAINT [FK_course_standard_course] FOREIGN KEY([tenant_id], [school_id], [course_id])
REFERENCES [dbo].[course] ([tenant_id], [school_id], [course_id])
GO
ALTER TABLE [dbo].[course_standard] CHECK CONSTRAINT [FK_course_standard_course]
GO
ALTER TABLE [dbo].[course_standard]  WITH CHECK ADD  CONSTRAINT [FK_course_standard_grade_us_standard] FOREIGN KEY([tenant_id], [school_id], [standard_ref_no])
REFERENCES [dbo].[grade_us_standard] ([tenant_id], [school_id], [standard_ref_no])
GO
ALTER TABLE [dbo].[course_standard] CHECK CONSTRAINT [FK_course_standard_grade_us_standard]
GO
ALTER TABLE [dbo].[course_variable_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_variable_schedule_block_periods] FOREIGN KEY([tenant_id], [school_id], [block_id], [period_id])
REFERENCES [dbo].[block_period] ([tenant_id], [school_id], [block_id], [period_id])
GO
ALTER TABLE [dbo].[course_variable_schedule] CHECK CONSTRAINT [FK_course_variable_schedule_block_periods]
GO
ALTER TABLE [dbo].[course_variable_schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_variable_schedule_rooms] FOREIGN KEY([tenant_id], [school_id], [room_id])
REFERENCES [dbo].[rooms] ([tenant_id], [school_id], [room_id])
GO
ALTER TABLE [dbo].[course_variable_schedule] CHECK CONSTRAINT [FK_course_variable_schedule_rooms]
GO
ALTER TABLE [dbo].[custom_fields]  WITH CHECK ADD  CONSTRAINT [FK_custom_fields_fields_category] FOREIGN KEY([tenant_id], [school_id], [category_id])
REFERENCES [dbo].[fields_category] ([tenant_id], [school_id], [category_id])
GO
ALTER TABLE [dbo].[custom_fields] CHECK CONSTRAINT [FK_custom_fields_fields_category]
GO
ALTER TABLE [dbo].[custom_fields]  WITH CHECK ADD  CONSTRAINT [FK_custom_fields_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[custom_fields] CHECK CONSTRAINT [FK_custom_fields_school_master]
GO
ALTER TABLE [dbo].[custom_fields_value]  WITH CHECK ADD  CONSTRAINT [FK_custom_fields_value_custom_fields] FOREIGN KEY([tenant_id], [school_id], [category_id], [field_id])
REFERENCES [dbo].[custom_fields] ([tenant_id], [school_id], [category_id], [field_id])
GO
ALTER TABLE [dbo].[custom_fields_value] CHECK CONSTRAINT [FK_custom_fields_value_custom_fields]
GO
ALTER TABLE [dbo].[dpdown_valuelist]  WITH CHECK ADD  CONSTRAINT [FK_dpdown_valuelist_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[dpdown_valuelist] CHECK CONSTRAINT [FK_dpdown_valuelist_school_master]
GO
ALTER TABLE [dbo].[effort_grade_library_category_item]  WITH CHECK ADD  CONSTRAINT [FK_effort_category_item_effort_category] FOREIGN KEY([tenant_id], [school_id], [effort_category_id])
REFERENCES [dbo].[effort_grade_library_category] ([tenant_id], [school_id], [effort_category_id])
GO
ALTER TABLE [dbo].[effort_grade_library_category_item] CHECK CONSTRAINT [FK_effort_category_item_effort_category]
GO
ALTER TABLE [dbo].[fields_category]  WITH CHECK ADD  CONSTRAINT [FK_custom_category_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[fields_category] CHECK CONSTRAINT [FK_custom_category_school_master]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [FK_grade_grade_scale] FOREIGN KEY([tenant_id], [school_id], [grade_scale_id])
REFERENCES [dbo].[grade_scale] ([tenant_id], [school_id], [grade_scale_id])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [FK_grade_grade_scale]
GO
ALTER TABLE [dbo].[grade_scale]  WITH CHECK ADD  CONSTRAINT [FK_grade_scale_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[grade_scale] CHECK CONSTRAINT [FK_grade_scale_school_master]
GO
ALTER TABLE [dbo].[gradelevels]  WITH CHECK ADD  CONSTRAINT [FK_gradelevels_grade_age_range] FOREIGN KEY([age_range_id])
REFERENCES [dbo].[grade_age_range] ([age_range_id])
GO
ALTER TABLE [dbo].[gradelevels] CHECK CONSTRAINT [FK_gradelevels_grade_age_range]
GO
ALTER TABLE [dbo].[gradelevels]  WITH CHECK ADD  CONSTRAINT [FK_gradelevels_grade_educational_stage] FOREIGN KEY([isced_code])
REFERENCES [dbo].[grade_educational_stage] ([isced_code])
GO
ALTER TABLE [dbo].[gradelevels] CHECK CONSTRAINT [FK_gradelevels_grade_educational_stage]
GO
ALTER TABLE [dbo].[gradelevels]  WITH CHECK ADD  CONSTRAINT [FK_gradelevels_grade_equivalency] FOREIGN KEY([equivalency_id])
REFERENCES [dbo].[grade_equivalency] ([equivalency_id])
GO
ALTER TABLE [dbo].[gradelevels] CHECK CONSTRAINT [FK_gradelevels_grade_equivalency]
GO
ALTER TABLE [dbo].[gradelevels]  WITH CHECK ADD  CONSTRAINT [FK_gradelevels_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[gradelevels] CHECK CONSTRAINT [FK_gradelevels_school_master]
GO
ALTER TABLE [dbo].[honor_rolls]  WITH CHECK ADD  CONSTRAINT [FK_honor_rolls_honor_rolls] FOREIGN KEY([tenant_id], [school_id], [marking_period_id])
REFERENCES [dbo].[school_years] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[honor_rolls] CHECK CONSTRAINT [FK_honor_rolls_honor_rolls]
GO
ALTER TABLE [dbo].[membership]  WITH CHECK ADD  CONSTRAINT [fk_table_membership_table_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[membership] CHECK CONSTRAINT [fk_table_membership_table_school_master]
GO
ALTER TABLE [dbo].[parent_address]  WITH CHECK ADD  CONSTRAINT [FK_parent_address_parent_info] FOREIGN KEY([tenant_id], [school_id], [parent_id])
REFERENCES [dbo].[parent_info] ([tenant_id], [school_id], [parent_id])
GO
ALTER TABLE [dbo].[parent_address] CHECK CONSTRAINT [FK_parent_address_parent_info]
GO
ALTER TABLE [dbo].[permission_category]  WITH CHECK ADD  CONSTRAINT [FK_permission_category_permission_group] FOREIGN KEY([tenant_id], [school_id], [permission_group_id])
REFERENCES [dbo].[permission_group] ([tenant_id], [school_id], [permission_group_id])
GO
ALTER TABLE [dbo].[permission_category] CHECK CONSTRAINT [FK_permission_category_permission_group]
GO
ALTER TABLE [dbo].[permission_group]  WITH CHECK ADD  CONSTRAINT [FK_permission_group_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[permission_group] CHECK CONSTRAINT [FK_permission_group_school_master]
GO
ALTER TABLE [dbo].[permission_subcategory]  WITH CHECK ADD  CONSTRAINT [FK_permission_subcategory_permission_category] FOREIGN KEY([tenant_id], [school_id], [permission_category_id])
REFERENCES [dbo].[permission_category] ([tenant_id], [school_id], [permission_category_id])
GO
ALTER TABLE [dbo].[permission_subcategory] CHECK CONSTRAINT [FK_permission_subcategory_permission_category]
GO
ALTER TABLE [dbo].[progress_periods]  WITH CHECK ADD  CONSTRAINT [FK_progress_periods_quarters] FOREIGN KEY([tenant_id], [school_id], [quarter_id])
REFERENCES [dbo].[quarters] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[progress_periods] CHECK CONSTRAINT [FK_progress_periods_quarters]
GO
ALTER TABLE [dbo].[quarters]  WITH CHECK ADD  CONSTRAINT [FK_quarters_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[quarters] CHECK CONSTRAINT [FK_quarters_school_master]
GO
ALTER TABLE [dbo].[quarters]  WITH CHECK ADD  CONSTRAINT [FK_quarters_semesters] FOREIGN KEY([tenant_id], [school_id], [semester_id])
REFERENCES [dbo].[semesters] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[quarters] CHECK CONSTRAINT [FK_quarters_semesters]
GO
ALTER TABLE [dbo].[role_permission]  WITH CHECK ADD  CONSTRAINT [FK_role_permission_membership] FOREIGN KEY([tenant_id], [school_id], [permission_group_id])
REFERENCES [dbo].[permission_group] ([tenant_id], [school_id], [permission_group_id])
GO
ALTER TABLE [dbo].[role_permission] CHECK CONSTRAINT [FK_role_permission_membership]
GO
ALTER TABLE [dbo].[role_permission]  WITH CHECK ADD  CONSTRAINT [FK_role_permission_permission_category] FOREIGN KEY([tenant_id], [school_id], [permission_category_id])
REFERENCES [dbo].[permission_category] ([tenant_id], [school_id], [permission_category_id])
GO
ALTER TABLE [dbo].[role_permission] CHECK CONSTRAINT [FK_role_permission_permission_category]
GO
ALTER TABLE [dbo].[role_permission]  WITH CHECK ADD  CONSTRAINT [FK_role_permission_permission_groupId] FOREIGN KEY([tenant_id], [school_id], [membership_id])
REFERENCES [dbo].[membership] ([tenant_id], [school_id], [membership_id])
GO
ALTER TABLE [dbo].[role_permission] CHECK CONSTRAINT [FK_role_permission_permission_groupId]
GO
ALTER TABLE [dbo].[role_permission]  WITH CHECK ADD  CONSTRAINT [FK_role_permission_permission_subcategory] FOREIGN KEY([tenant_id], [school_id], [permission_subcategory_id])
REFERENCES [dbo].[permission_subcategory] ([tenant_id], [school_id], [permission_subcategory_id])
GO
ALTER TABLE [dbo].[role_permission] CHECK CONSTRAINT [FK_role_permission_permission_subcategory]
GO
ALTER TABLE [dbo].[school_calendars]  WITH CHECK ADD  CONSTRAINT [FK_school_calendars_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[school_calendars] CHECK CONSTRAINT [FK_school_calendars_school_master]
GO
ALTER TABLE [dbo].[school_detail]  WITH CHECK ADD  CONSTRAINT [FK_school_detail_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[school_detail] CHECK CONSTRAINT [FK_school_detail_school_master]
GO
ALTER TABLE [dbo].[school_master]  WITH CHECK ADD  CONSTRAINT [FK_school_master_plans] FOREIGN KEY([tenant_id], [school_id], [plan_id])
REFERENCES [dbo].[plans] ([tenant_id], [school_id], [plan_id])
GO
ALTER TABLE [dbo].[school_master] CHECK CONSTRAINT [FK_school_master_plans]
GO
ALTER TABLE [dbo].[school_years]  WITH CHECK ADD  CONSTRAINT [FK_school_years_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[school_years] CHECK CONSTRAINT [FK_school_years_school_master]
GO
ALTER TABLE [dbo].[search_filter]  WITH CHECK ADD  CONSTRAINT [FK_search_filter_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[search_filter] CHECK CONSTRAINT [FK_search_filter_school_master]
GO
ALTER TABLE [dbo].[search_filter]  WITH CHECK ADD  CONSTRAINT [FK_search_filter_user_master] FOREIGN KEY([tenant_id], [school_id], [emailaddress])
REFERENCES [dbo].[user_master] ([tenant_id], [school_id], [emailaddress])
GO
ALTER TABLE [dbo].[search_filter] CHECK CONSTRAINT [FK_search_filter_user_master]
GO
ALTER TABLE [dbo].[semesters]  WITH CHECK ADD  CONSTRAINT [FK_semesters_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[semesters] CHECK CONSTRAINT [FK_semesters_school_master]
GO
ALTER TABLE [dbo].[semesters]  WITH CHECK ADD  CONSTRAINT [FK_semesters_school_years] FOREIGN KEY([tenant_id], [school_id], [year_id])
REFERENCES [dbo].[school_years] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[semesters] CHECK CONSTRAINT [FK_semesters_school_years]
GO
ALTER TABLE [dbo].[staff_certificate_info]  WITH CHECK ADD  CONSTRAINT [FK_staff_certificate_info_staff_master] FOREIGN KEY([tenant_id], [staff_id])
REFERENCES [dbo].[staff_master] ([tenant_id], [staff_id])
GO
ALTER TABLE [dbo].[staff_certificate_info] CHECK CONSTRAINT [FK_staff_certificate_info_staff_master]
GO
ALTER TABLE [dbo].[staff_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_staff_coursesection_schedule_course_section] FOREIGN KEY([tenant_id], [school_id], [course_id], [course_section_id])
REFERENCES [dbo].[course_section] ([tenant_id], [school_id], [course_id], [course_section_id])
GO
ALTER TABLE [dbo].[staff_coursesection_schedule] CHECK CONSTRAINT [FK_staff_coursesection_schedule_course_section]
GO
ALTER TABLE [dbo].[staff_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_staff_coursesection_schedule_quarters] FOREIGN KEY([tenant_id], [school_id], [qtr_marking_period_id])
REFERENCES [dbo].[quarters] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[staff_coursesection_schedule] CHECK CONSTRAINT [FK_staff_coursesection_schedule_quarters]
GO
ALTER TABLE [dbo].[staff_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_staff_coursesection_schedule_school_years] FOREIGN KEY([tenant_id], [school_id], [yr_marking_period_id])
REFERENCES [dbo].[school_years] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[staff_coursesection_schedule] CHECK CONSTRAINT [FK_staff_coursesection_schedule_school_years]
GO
ALTER TABLE [dbo].[staff_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_staff_coursesection_schedule_semesters] FOREIGN KEY([tenant_id], [school_id], [smstr_marking_period_id])
REFERENCES [dbo].[semesters] ([tenant_id], [school_id], [marking_period_id])
GO
ALTER TABLE [dbo].[staff_coursesection_schedule] CHECK CONSTRAINT [FK_staff_coursesection_schedule_semesters]
GO
ALTER TABLE [dbo].[staff_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_staff_coursesection_schedule_staff_master] FOREIGN KEY([tenant_id], [staff_id])
REFERENCES [dbo].[staff_master] ([tenant_id], [staff_id])
GO
ALTER TABLE [dbo].[staff_coursesection_schedule] CHECK CONSTRAINT [FK_staff_coursesection_schedule_staff_master]
GO
ALTER TABLE [dbo].[staff_master]  WITH CHECK ADD  CONSTRAINT [FK_staff_master_language] FOREIGN KEY([first_language])
REFERENCES [dbo].[language] ([lang_id])
GO
ALTER TABLE [dbo].[staff_master] CHECK CONSTRAINT [FK_staff_master_language]
GO
ALTER TABLE [dbo].[staff_master]  WITH CHECK ADD  CONSTRAINT [FK_staff_master_language1] FOREIGN KEY([second_language])
REFERENCES [dbo].[language] ([lang_id])
GO
ALTER TABLE [dbo].[staff_master] CHECK CONSTRAINT [FK_staff_master_language1]
GO
ALTER TABLE [dbo].[staff_master]  WITH CHECK ADD  CONSTRAINT [FK_staff_master_language2] FOREIGN KEY([third_language])
REFERENCES [dbo].[language] ([lang_id])
GO
ALTER TABLE [dbo].[staff_master] CHECK CONSTRAINT [FK_staff_master_language2]
GO
ALTER TABLE [dbo].[staff_master]  WITH CHECK ADD  CONSTRAINT [FK_staff_master_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[staff_master] CHECK CONSTRAINT [FK_staff_master_school_master]
GO
ALTER TABLE [dbo].[staff_school_info]  WITH CHECK ADD  CONSTRAINT [FK_staff_school_info_staff_master] FOREIGN KEY([tenant_id], [staff_id])
REFERENCES [dbo].[staff_master] ([tenant_id], [staff_id])
GO
ALTER TABLE [dbo].[staff_school_info] CHECK CONSTRAINT [FK_staff_school_info_staff_master]
GO
ALTER TABLE [dbo].[state]  WITH CHECK ADD  CONSTRAINT [FK_state_country] FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[state] CHECK CONSTRAINT [FK_state_country]
GO
ALTER TABLE [dbo].[student_comments]  WITH CHECK ADD  CONSTRAINT [FK_student_comments_student_master] FOREIGN KEY([tenant_id], [school_id], [student_id])
REFERENCES [dbo].[student_master] ([tenant_id], [school_id], [student_id])
GO
ALTER TABLE [dbo].[student_comments] CHECK CONSTRAINT [FK_student_comments_student_master]
GO
ALTER TABLE [dbo].[student_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_student_coursesection_schedule_course_section] FOREIGN KEY([tenant_id], [school_id], [course_id], [course_section_id])
REFERENCES [dbo].[course_section] ([tenant_id], [school_id], [course_id], [course_section_id])
GO
ALTER TABLE [dbo].[student_coursesection_schedule] CHECK CONSTRAINT [FK_student_coursesection_schedule_course_section]
GO
ALTER TABLE [dbo].[student_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_student_coursesection_schedule_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[student_coursesection_schedule] CHECK CONSTRAINT [FK_student_coursesection_schedule_school_master]
GO
ALTER TABLE [dbo].[student_coursesection_schedule]  WITH CHECK ADD  CONSTRAINT [FK_student_coursesection_schedule_student_master] FOREIGN KEY([tenant_id], [school_id], [student_id])
REFERENCES [dbo].[student_master] ([tenant_id], [school_id], [student_id])
GO
ALTER TABLE [dbo].[student_coursesection_schedule] CHECK CONSTRAINT [FK_student_coursesection_schedule_student_master]
GO
ALTER TABLE [dbo].[student_documents]  WITH CHECK ADD  CONSTRAINT [FK_student_documents_student_master] FOREIGN KEY([tenant_id], [school_id], [student_id])
REFERENCES [dbo].[student_master] ([tenant_id], [school_id], [student_id])
GO
ALTER TABLE [dbo].[student_documents] CHECK CONSTRAINT [FK_student_documents_student_master]
GO
ALTER TABLE [dbo].[student_enrollment]  WITH CHECK ADD  CONSTRAINT [FK_student_enrollment_gradelevels] FOREIGN KEY([tenant_id], [school_id], [grade_id])
REFERENCES [dbo].[gradelevels] ([tenant_id], [school_id], [grade_id])
GO
ALTER TABLE [dbo].[student_enrollment] CHECK CONSTRAINT [FK_student_enrollment_gradelevels]
GO
ALTER TABLE [dbo].[student_enrollment]  WITH CHECK ADD  CONSTRAINT [FK_student_enrollment_student_master] FOREIGN KEY([tenant_id], [school_id], [student_guid])
REFERENCES [dbo].[student_master] ([tenant_id], [school_id], [student_guid])
GO
ALTER TABLE [dbo].[student_enrollment] CHECK CONSTRAINT [FK_student_enrollment_student_master]
GO
ALTER TABLE [dbo].[student_enrollment_code]  WITH CHECK ADD  CONSTRAINT [FK_student_enrollment_code_school_master1] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[student_enrollment_code] CHECK CONSTRAINT [FK_student_enrollment_code_school_master1]
GO
ALTER TABLE [dbo].[student_master]  WITH CHECK ADD  CONSTRAINT [FK_student_master_language] FOREIGN KEY([first_language_id])
REFERENCES [dbo].[language] ([lang_id])
GO
ALTER TABLE [dbo].[student_master] CHECK CONSTRAINT [FK_student_master_language]
GO
ALTER TABLE [dbo].[student_master]  WITH CHECK ADD  CONSTRAINT [FK_student_master_language1] FOREIGN KEY([second_language_id])
REFERENCES [dbo].[language] ([lang_id])
GO
ALTER TABLE [dbo].[student_master] CHECK CONSTRAINT [FK_student_master_language1]
GO
ALTER TABLE [dbo].[student_master]  WITH CHECK ADD  CONSTRAINT [FK_student_master_language2] FOREIGN KEY([third_language_id])
REFERENCES [dbo].[language] ([lang_id])
GO
ALTER TABLE [dbo].[student_master] CHECK CONSTRAINT [FK_student_master_language2]
GO
ALTER TABLE [dbo].[student_master]  WITH CHECK ADD  CONSTRAINT [FK_student_master_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[student_master] CHECK CONSTRAINT [FK_student_master_school_master]
GO
ALTER TABLE [dbo].[student_master]  WITH CHECK ADD  CONSTRAINT [FK_student_master_sections] FOREIGN KEY([tenant_id], [school_id], [section_id])
REFERENCES [dbo].[sections] ([tenant_id], [school_id], [section_id])
GO
ALTER TABLE [dbo].[student_master] CHECK CONSTRAINT [FK_student_master_sections]
GO
ALTER TABLE [dbo].[user_master]  WITH CHECK ADD  CONSTRAINT [FK_user_master_language] FOREIGN KEY([lang_id])
REFERENCES [dbo].[language] ([lang_id])
GO
ALTER TABLE [dbo].[user_master] CHECK CONSTRAINT [FK_user_master_language]
GO
ALTER TABLE [dbo].[user_master]  WITH CHECK ADD  CONSTRAINT [FK_user_master_membership] FOREIGN KEY([tenant_id], [school_id], [membership_id])
REFERENCES [dbo].[membership] ([tenant_id], [school_id], [membership_id])
GO
ALTER TABLE [dbo].[user_master] CHECK CONSTRAINT [FK_user_master_membership]
GO
ALTER TABLE [dbo].[user_secret_questions]  WITH CHECK ADD  CONSTRAINT [FK_user_secret_questions_user_master] FOREIGN KEY([tenant_id], [school_id], [emailaddress])
REFERENCES [dbo].[user_master] ([tenant_id], [school_id], [emailaddress])
GO
ALTER TABLE [dbo].[user_secret_questions] CHECK CONSTRAINT [FK_user_secret_questions_user_master]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'membershipids separated by comma' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'calendar_events', @level2type=N'COLUMN',@level2name=N'visible_to_membership_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Event color in HEX code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'calendar_events', @level2type=N'COLUMN',@level2name=N'event_color'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'event applicable to all calenders within academic year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'calendar_events', @level2type=N'COLUMN',@level2name=N'system_wide_event'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Core'' or ''Elective''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'course', @level2type=N'COLUMN',@level2name=N'course_category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'choose between US Common Core library or school specific standards library.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'course', @level2type=N'COLUMN',@level2name=N'standard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Ungraded'',''Numeric'',''School_Scale'',''Teacher_Scale''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'course_section', @level2type=N'COLUMN',@level2name=N'grade_scale_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fixed Schedule (1) / Variable Schedule (2) / Calendar Days (3) / Bell schedule (4)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'course_section', @level2type=N'COLUMN',@level2name=N'schedule_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Starting Sunday as 0, 0|1|2|3|4|5|6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'course_section', @level2type=N'COLUMN',@level2name=N'meeting_days'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Take categoryid from custom_category table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'category_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'module like "school", "student" etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datatype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Field Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LOV for dropdown separated by | character.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'select_options'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'wheher it is applicable throughput all forms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'system_field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Whether value input is required' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'required'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'default value selection on form load' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'default_selection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'hide the custom field on UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields', @level2type=N'COLUMN',@level2name=N'hide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Target_is school/student/staff id for whom custom field value is entered. For School module it will be always school id.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields_value', @level2type=N'COLUMN',@level2name=N'target_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Student'' | ''School'' | ''Staff''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields_value', @level2type=N'COLUMN',@level2name=N'module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''Select'' or ''Text''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields_value', @level2type=N'COLUMN',@level2name=N'custom_field_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User input value...Textbox->textvalue, Select-->Value separated by ''|'', Date --> Date in string' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'custom_fields_value', @level2type=N'COLUMN',@level2name=N'custom_field_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'module like "school", "student" etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fields_category', @level2type=N'COLUMN',@level2name=N'module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'can be considered as profileid of Opensis1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'membership', @level2type=N'COLUMN',@level2name=N'membership_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E.g. admin,student,teacher' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'membership', @level2type=N'COLUMN',@level2name=N'profile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Signifies group of user for whom notice is visible. to be saved as comma separated values. if user''s membership_id falls in any of the value, he can see the notice.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notice', @level2type=N'COLUMN',@level2name=N'target_membership_ids'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tenantid#schoolid#studentid | tenantid#schoolid#studentid | ....' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parent_associationship', @level2type=N'COLUMN',@level2name=N'associationship'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'emailaddress mapped to user_master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parent_info', @level2type=N'COLUMN',@level2name=N'login_email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'999.99.99' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'release_number', @level2type=N'COLUMN',@level2name=N'release_number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Starting Sunday as 0, 0|1|2|3|4|5|6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'staff_coursesection_schedule', @level2type=N'COLUMN',@level2name=N'meeting_days'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if true, home address will be replicated to mailing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'staff_master', @level2type=N'COLUMN',@level2name=N'mailing_address_same_to_home'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LOV of N/A, Transferred In,Rolled Over,New' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_enrollment', @level2type=N'COLUMN',@level2name=N'rolling_option'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plan is language will be displayed in dropdown from language table and selected corresponding id will be stored into table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'first_language_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plan is language will be displayed in dropdown from language table and selected corresponding id will be stored into table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'second_language_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plan is language will be displayed in dropdown from language table and selected corresponding id will be stored into table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'third_language_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if true, home address will be replicated to mailing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'mailing_address_same_to_home'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'"Internal" or "External". Default "Internal"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'enrollment_type'
GO
