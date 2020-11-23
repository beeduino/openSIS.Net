USE [opensisv2]
GO
/****** Object:  Table [dbo].[attendance_code]    Script Date: 23/11/2020 11:23:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[state_code] [varchar](1) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attendance_code_categories]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[calendar_events]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[stateid] [int] NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[countrycode] [varchar](5) NULL,
 CONSTRAINT [PK_country_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[custom_fields]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[custom_fields_value]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fields_category]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grade_equivalency]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grade_equivalency](
	[isced_grade_level] [varchar](8) NOT NULL,
	[grade_description] [varchar](50) NULL,
	[age_range] [varchar](5) NULL,
 CONSTRAINT [PK_grade_equivalency] PRIMARY KEY CLUSTERED 
(
	[isced_grade_level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gradelevels]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gradelevels](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
	[short_name] [varchar](5) NULL,
	[title] [varchar](50) NULL,
	[isced_grade_level] [varchar](8) NULL,
	[next_grade_id] [int] NULL,
	[sort_order] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [pk_gradelevels] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[language]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[language](
	[lang_id] [int] NOT NULL,
	[lcid] [nchar](10) NULL,
	[locale] [nchar](50) NULL,
	[language_code] [nchar](10) NULL,
 CONSTRAINT [pk_table_language] PRIMARY KEY CLUSTERED 
(
	[lang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[membership]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[membership](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[membership_id] [int] NOT NULL,
	[profile] [varchar](30) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[access] [varchar](max) NULL,
	[weekly_update] [bit] NULL,
	[last_updated] [datetime] NOT NULL,
	[updated_by] [varchar](100) NOT NULL,
 CONSTRAINT [pk_table_membership_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[membership_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[notice]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[parent_info]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[parent_info](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[relationship] [varchar](20) NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[home_phone] [varchar](15) NULL,
	[work_phone] [varchar](15) NULL,
	[mobile] [varchar](15) NULL,
	[email] [varchar](150) NULL,
	[student_address_same] [bit] NULL,
	[address_line_one] [varchar](200) NULL,
	[address_line_two] [varchar](200) NULL,
	[country] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[zip] [varchar](15) NULL,
	[is_custodian] [bit] NOT NULL,
	[is_portal_user] [bit] NOT NULL,
	[portal_user_id] [varchar](150) NULL,
	[bus_pickup] [bit] NULL,
	[bus_dropoff] [bit] NULL,
	[contact_type] [varchar](9) NULL,
	[associationship] [varchar](max) NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_parent_info] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[plans]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[progress_periods]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[quarters]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[school_calendars]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[school_detail]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[gender] [nchar](6) NULL,
	[internet] [bit] NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[school_master]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[school_master](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[school_internal_id] [varchar](50) NULL,
	[school_alt_id] [nchar](10) NULL,
	[school_state_id] [nchar](10) NULL,
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
	[zip] [nchar](10) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[school_periods]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[school_periods](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[school_years]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sections]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[semesters]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[countryid] [int] NULL,
 CONSTRAINT [pk_statemaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student_comments]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_comments](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[comment_id] [int] NOT NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_student_comments] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_documents]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_documents](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[document_id] [int] NOT NULL,
	[file_uploaded] [varbinary](max) NULL,
	[uploaded_on] [datetime] NULL,
	[uploaded_by] [varchar](100) NULL,
 CONSTRAINT [PK_student_documents] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC,
	[document_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_enrollment]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_enrollment](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[enrollment_id] [int] NULL,
	[student_id] [int] NOT NULL,
	[grade_id] [int] NULL,
	[section_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[enrollment_code] [int] NULL,
	[drop_code] [int] NULL,
	[next_school] [int] NULL,
	[calendar_id] [int] NULL,
	[last_school] [int] NULL,
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_student_enrollment] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_enrollment_code]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_master]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_master](
	[tenant_id] [uniqueidentifier] NOT NULL,
	[school_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[alternate_id] [varchar](50) NULL,
	[district_id] [int] NULL,
	[state_id] [int] NULL,
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
	[home_phone] [varchar](15) NULL,
	[mobile_phone] [varchar](15) NULL,
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
	[home_address_zip] [varchar](15) NULL,
	[bus_No] [varchar](15) NULL,
	[school_bus_pick_up] [bit] NULL,
	[school_bus_drop_off] [bit] NULL,
	[mailing_address_same_to_home] [bit] NULL,
	[mailing_address_line_one] [varchar](200) NULL,
	[mailing_address_line_two] [varchar](200) NULL,
	[mailing_address_city] [varchar](50) NULL,
	[mailing_address_state] [varchar](50) NULL,
	[mailing_address_country] [varchar](50) NULL,
	[mailing_address_zip] [varchar](15) NULL,
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
 CONSTRAINT [PK_student_master] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_master]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[last_updated] [datetime] NULL,
	[updated_by] [varchar](100) NULL,
 CONSTRAINT [PK_user_master_1] PRIMARY KEY CLUSTERED 
(
	[tenant_id] ASC,
	[school_id] ASC,
	[emailaddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_secret_questions]    Script Date: 23/11/2020 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[membership] ADD  CONSTRAINT [DF_Table_membership_weekly_update]  DEFAULT ((0)) FOR [weekly_update]
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
ALTER TABLE [dbo].[city]  WITH NOCHECK ADD  CONSTRAINT [FK_city_state] FOREIGN KEY([id])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_state]
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
ALTER TABLE [dbo].[fields_category]  WITH CHECK ADD  CONSTRAINT [FK_custom_category_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[fields_category] CHECK CONSTRAINT [FK_custom_category_school_master]
GO
ALTER TABLE [dbo].[gradelevels]  WITH CHECK ADD  CONSTRAINT [FK_gradelevels_grade_equivalency] FOREIGN KEY([isced_grade_level])
REFERENCES [dbo].[grade_equivalency] ([isced_grade_level])
GO
ALTER TABLE [dbo].[gradelevels] CHECK CONSTRAINT [FK_gradelevels_grade_equivalency]
GO
ALTER TABLE [dbo].[gradelevels]  WITH CHECK ADD  CONSTRAINT [FK_gradelevels_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[gradelevels] CHECK CONSTRAINT [FK_gradelevels_school_master]
GO
ALTER TABLE [dbo].[membership]  WITH CHECK ADD  CONSTRAINT [fk_table_membership_table_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[membership] CHECK CONSTRAINT [fk_table_membership_table_school_master]
GO
ALTER TABLE [dbo].[parent_info]  WITH CHECK ADD  CONSTRAINT [FK_parent_info_student_master] FOREIGN KEY([tenant_id], [school_id], [student_id])
REFERENCES [dbo].[student_master] ([tenant_id], [school_id], [student_id])
GO
ALTER TABLE [dbo].[parent_info] CHECK CONSTRAINT [FK_parent_info_student_master]
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
ALTER TABLE [dbo].[school_periods]  WITH CHECK ADD  CONSTRAINT [FK_school_periods_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[school_periods] CHECK CONSTRAINT [FK_school_periods_school_master]
GO
ALTER TABLE [dbo].[school_years]  WITH CHECK ADD  CONSTRAINT [FK_school_years_school_master] FOREIGN KEY([tenant_id], [school_id])
REFERENCES [dbo].[school_master] ([tenant_id], [school_id])
GO
ALTER TABLE [dbo].[school_years] CHECK CONSTRAINT [FK_school_years_school_master]
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
ALTER TABLE [dbo].[student_enrollment]  WITH CHECK ADD  CONSTRAINT [FK_student_enrollment_sections] FOREIGN KEY([tenant_id], [school_id], [section_id])
REFERENCES [dbo].[sections] ([tenant_id], [school_id], [section_id])
GO
ALTER TABLE [dbo].[student_enrollment] CHECK CONSTRAINT [FK_student_enrollment_sections]
GO
ALTER TABLE [dbo].[student_enrollment]  WITH CHECK ADD  CONSTRAINT [FK_student_enrollment_student_master] FOREIGN KEY([tenant_id], [school_id], [student_id])
REFERENCES [dbo].[student_master] ([tenant_id], [school_id], [student_id])
GO
ALTER TABLE [dbo].[student_enrollment] CHECK CONSTRAINT [FK_student_enrollment_student_master]
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'e.g. Administrator,Student,Teacher,Dept. head' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'membership', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Signifies group of user for whom notice is visible. to be saved as comma separated values. if user''s membership_id falls in any of the value, he can see the notice.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notice', @level2type=N'COLUMN',@level2name=N'target_membership_ids'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'emailaddress mapped to user_master' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parent_info', @level2type=N'COLUMN',@level2name=N'portal_user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary | Secondary | Other' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parent_info', @level2type=N'COLUMN',@level2name=N'contact_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tenantid#schoolid#studentid | tenantid#schoolid#studentid | ....' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parent_info', @level2type=N'COLUMN',@level2name=N'associationship'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plan is language will be displayed in dropdown from language table and selected corresponding id will be stored into table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'first_language_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plan is language will be displayed in dropdown from language table and selected corresponding id will be stored into table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'second_language_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plan is language will be displayed in dropdown from language table and selected corresponding id will be stored into table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'third_language_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if true, home address will be replicated to mailing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student_master', @level2type=N'COLUMN',@level2name=N'mailing_address_same_to_home'
GO
