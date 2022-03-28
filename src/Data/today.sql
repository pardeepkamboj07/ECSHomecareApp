USE [master]
GO
/****** Object:  Database [ESHomeCareDB.IND]    Script Date: 28-03-2022 10:38:12 ******/
CREATE DATABASE [ESHomeCareDB.IND]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESHomeCareDB.IND', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ESHomeCareDB.IND.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ESHomeCareDB.IND_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ESHomeCareDB.IND_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ESHomeCareDB.IND] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ESHomeCareDB.IND].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ARITHABORT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET RECOVERY FULL 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  MULTI_USER 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ESHomeCareDB.IND] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ESHomeCareDB.IND', N'ON'
GO
ALTER DATABASE [ESHomeCareDB.IND] SET QUERY_STORE = OFF
GO
USE [ESHomeCareDB.IND]
GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[AddressType] [int] NOT NULL,
	[Owner] [varchar](50) NULL,
	[FlatNo] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttendance](
	[AttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[Reason] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Notes] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblAttendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAvailabilityMaster]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAvailabilityMaster](
	[AvailabilityId] [int] IDENTITY(1,1) NOT NULL,
	[AvailabilityName] [varchar](max) NULL,
 CONSTRAINT [PK_tblAvailabilityMaster] PRIMARY KEY CLUSTERED 
(
	[AvailabilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCases]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCases](
	[CaseId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[ReprtedDate] [datetime] NOT NULL,
	[AssignedOn] [datetime] NOT NULL,
	[ClientId] [int] NULL,
	[CaseType] [varchar](50) NULL,
	[Result] [varchar](max) NULL,
	[DeclineReason] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[HoursPerShift] [int] NULL,
	[DaysPerWeek] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblCases] PRIMARY KEY CLUSTERED 
(
	[CaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClient]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClient](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[BillTo] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[EmgContact] [varchar](50) NULL,
	[Ethnicity] [tinyint] NULL,
	[Gender] [tinyint] NULL,
	[Coordinator] [int] NOT NULL,
	[Nurse] [int] NULL,
	[MaritalStatus] [tinyint] NULL,
	[OfChild] [tinyint] NULL,
	[SSN] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[AltId] [varchar](10) NULL,
	[ID2] [varchar](10) NULL,
	[ID3] [varchar](10) NULL,
	[InsuranceID] [varchar](100) NULL,
	[WorkerName] [varchar](50) NULL,
	[WorkerContact] [varchar](50) NULL,
	[ReferredBy] [varchar](50) NULL,
	[IsHourly] [bit] NOT NULL,
	[TimeSlip] [bit] NOT NULL,
	[PriorityCode] [tinyint] NULL,
	[ClientStatus] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblClient] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientMeeting]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientMeeting](
	[MeetingId] [bigint] IDENTITY(1,1) NOT NULL,
	[MeetingNote] [nvarchar](500) NULL,
	[MeetingDate] [datetime] NULL,
	[MeetingStartHrsTime] [int] NULL,
	[MeetingStartMinsTime] [int] NULL,
	[MeetingEndHrsTime] [int] NULL,
	[MeetingEndMinsTime] [int] NULL,
	[TotalMeetingHrs] [int] NULL,
	[TotalMeetingMins] [int] NULL,
	[ClientID] [bigint] NULL,
	[StartTimeType] [char](2) NULL,
	[EndTimeType] [char](2) NULL,
	[EnteredDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompliance]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompliance](
	[ComplianceId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[CompletedOn] [datetime] NOT NULL,
	[Category] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Result] [varchar](max) NULL,
	[Nurse] [int] NULL,
	[Notes] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblCompliance] PRIMARY KEY CLUSTERED 
(
	[ComplianceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountry](
	[Code] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[InternetCode] [nvarchar](3) NOT NULL,
	[NumericCode] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpClientMeeting]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpClientMeeting](
	[MeetingId] [bigint] NOT NULL,
	[EmpId] [int] NOT NULL,
 CONSTRAINT [PK_tblEmpClientMeeting_1] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC,
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDeclinedCase]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpDeclinedCase](
	[DeclinedCaseId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReportedDate] [date] NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[CaseId] [bigint] NOT NULL,
	[DeclinedReason] [varchar](max) NOT NULL,
	[AssignmentStartDate] [date] NOT NULL,
	[Day] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[Note] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeclinedCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpKey] [varchar](50) NOT NULL,
	[SSN] [varchar](50) NOT NULL,
	[EmpType] [tinyint] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CellPhone] [varchar](50) NOT NULL,
	[DateOfHire] [datetime] NOT NULL,
	[HomePhone] [varchar](50) NULL,
	[DateOfFirstCase] [datetime] NULL,
	[Gender] [varchar](50) NULL,
	[HRSupervisor] [int] NULL,
	[Enthnicity] [tinyint] NULL,
	[MaritalStatus] [tinyint] NULL,
	[Dependents] [tinyint] NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[TaxState] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[EmgContact] [varchar](50) NULL,
	[EmgPhone] [varchar](50) NULL,
	[Municipality] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[EmpStatus] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatus]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpStatus](
	[StatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[ScheduleId] [bigint] NOT NULL,
	[OfficeUserId] [bigint] NOT NULL,
	[Note] [varchar](250) NOT NULL,
	[OKResume] [bit] NOT NULL,
	[ReHire] [bit] NOT NULL,
	[TextCheck] [bit] NOT NULL,
	[ScreenCheck] [bit] NOT NULL,
	[EmailCheck] [bit] NOT NULL,
	[EffectiveDate] [varchar](50) NOT NULL,
	[ReturnDate] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK__tblEmpSt__C8EE2063425FBB1E] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusMaster]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpStatusMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusScheduling]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpStatusScheduling](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpType]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblEmpType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIncident]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIncident](
	[IncidentId] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[IncidentDate] [varchar](50) NULL,
	[ClientId] [int] NULL,
	[IncidentDetail] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblIncident] PRIMARY KEY CLUSTERED 
(
	[IncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblBranch] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LogIn] [datetime] NOT NULL,
	[LogOut] [datetime] NULL,
 CONSTRAINT [PK_tblLogin] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaster]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaster](
	[MasterId] [int] IDENTITY(1,1) NOT NULL,
	[MasterType] [tinyint] NOT NULL,
	[ItemId] [tinyint] NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblMaritalStatus] PRIMARY KEY CLUSTERED 
(
	[MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMasterType]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterType](
	[MasterITyped] [tinyint] IDENTITY(1,1) NOT NULL,
	[MasterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblMasterType] PRIMARY KEY CLUSTERED 
(
	[MasterITyped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeeting]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeeting](
	[MeetingId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[MeetingDate] [datetime] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[MeetingNote] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblMeeting] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOfficeUserMaster]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOfficeUserMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayRate]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayRate](
	[RateId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpId] [bigint] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ClientId] [bigint] NULL,
	[Description] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[Hourly] [decimal](18, 0) NULL,
	[LiveIn] [decimal](18, 0) NULL,
	[Visit] [decimal](18, 0) NULL,
	[OverHourly] [decimal](18, 0) NULL,
	[OverLiveIn] [decimal](18, 0) NULL,
	[OverVisit] [decimal](18, 0) NULL,
	[IncludedHour] [decimal](18, 0) NULL,
	[AdditionalHour] [decimal](18, 0) NULL,
	[Mileage] [decimal](18, 0) NULL,
	[TravelTime] [decimal](18, 0) NULL,
	[Gas] [decimal](18, 0) NULL,
	[Extra] [decimal](18, 0) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_tblPayRate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStates]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStates](
	[CountryCode] [nvarchar](3) NOT NULL,
	[InternetCountryCode] [nvarchar](3) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NULL,
	[IsActive] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[TypeDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblUserType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblClient] ON 
GO
INSERT [dbo].[tblClient] ([ClientId], [BillTo], [FirstName], [MiddleName], [LastName], [Email], [Contact], [EmgContact], [Ethnicity], [Gender], [Coordinator], [Nurse], [MaritalStatus], [OfChild], [SSN], [DOB], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [ClientStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (1, NULL, N'Rakesh', N'kumar', N'Gangwar', N'rakesh@gmail.com', N'9027972157', N'9027972157', 3, 1, 4, 4, 2, 1, N'TEST10023', CAST(N'1922-01-24T18:30:00.000' AS DateTime), N'rakesh', N'rakesh1', N'rakesh2', N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, 0, CAST(N'2022-03-23T17:32:38.897' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblClient] OFF
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ABW', N'Aruba', N'AW', N'533')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AFG', N'Afghanistan', N'AF', N'4  ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AGO', N'Angola', N'AO', N'24 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AIA', N'Anguilla', N'AI', N'660')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ALA', N'Åland Islands', N'AX', N'248')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ALB', N'Albania', N'AL', N'8  ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AND', N'Andorra', N'AD', N'20 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ANT', N'Netherlands Antilles', N'NT', N'NULL')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARE', N'United Arab Emirates', N'AE', N'784')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARG', N'Argentina', N'AR', N'32 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARM', N'Armenia', N'AM', N'51 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ASM', N'American Samoa', N'AS', N'16 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATA', N'Antarctica', N'AQ', N'10 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATF', N'French Southern Territories', N'TF', N'260')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATG', N'Antigua and Barbuda', N'AG', N'28 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AUS', N'Australia', N'AU', N'36 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AUT', N'Austria', N'AT', N'40 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AZE', N'Azerbaijan', N'AZ', N'31 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BDI', N'Burundi', N'BI', N'108')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BEL', N'Belgium', N'BE', N'56 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BEN', N'Benin', N'BJ', N'204')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BES', N'Bonaire Sint Eustatius And Saba', N'BQ', N'535')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BFA', N'Burkina Faso', N'BF', N'854')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BGD', N'Bangladesh', N'BD', N'50 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BGR', N'Bulgaria', N'BG', N'100')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BHR', N'Bahrain', N'BH', N'48 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BHS', N'Bahamas', N'BS', N'44 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BIH', N'Bosnia and Herzegovina', N'BA', N'70 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLM', N'Saint Barthélemy', N'BL', N'652')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLR', N'Belarus', N'BY', N'112')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLZ', N'Belize', N'BZ', N'84 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BMU', N'Bermuda', N'BM', N'60 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BOL', N'Bolivia, Plurinational State Of', N'BO', N'68 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRA', N'Brazil', N'BR', N'76 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRB', N'Barbados', N'BB', N'52 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRN', N'Brunei Darussalam', N'BN', N'96 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BTN', N'Bhutan', N'BT', N'64 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BVT', N'Bouvet Island', N'BV', N'74 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BWA', N'Botswana', N'BW', N'72 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CAF', N'Central African Republic', N'CF', N'140')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CAN', N'Canada', N'CA', N'124')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CCK', N'Cocos (Keeling) Islands', N'CC', N'166')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHE', N'Switzerland', N'CH', N'756')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHL', N'Chile', N'CL', N'152')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHN', N'China', N'CN', N'156')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CIV', N'Côte d''Ivoire', N'CI', N'384')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CMR', N'Cameroon', N'CM', N'120')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COD', N'Congo (the Democratic Republic of the)', N'CD', N'180')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COG', N'Congo', N'CG', N'178')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COK', N'Cook Islands', N'CK', N'184')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COL', N'Colombia', N'CO', N'170')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COM', N'Comoros', N'KM', N'174')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CPV', N'Cabo Verde', N'CV', N'132')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CRI', N'Costa Rica', N'CR', N'188')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CUB', N'Cuba', N'CU', N'192')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CUW', N'Curaçao', N'CW', N'531')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CXR', N'Christmas Island', N'CX', N'162')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CYM', N'Cayman Islands', N'KY', N'136')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CYP', N'Cyprus', N'CY', N'196')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CZE', N'Czech Republic', N'CZ', N'203')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DEU', N'Germany', N'DE', N'276')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DJI', N'Djibouti', N'DJ', N'262')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DMA', N'Dominica', N'DM', N'212')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DNK', N'Denmark', N'DK', N'208')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DOM', N'Dominican Republic', N'DO', N'214')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DZA', N'Algeria', N'DZ', N'12 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ECU', N'Ecuador', N'EC', N'218')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'EGY', N'Egypt', N'EG', N'818')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ERI', N'Eritrea', N'ER', N'232')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ESH', N'Western Sahara*', N'EH', N'732')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ESP', N'Spain', N'ES', N'724')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'EST', N'Estonia', N'EE', N'233')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ETH', N'Ethiopia', N'ET', N'231')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FIN', N'Finland', N'FI', N'246')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FJI', N'Fiji', N'FJ', N'242')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FLK', N'Falkland Islands', N'FK', N'238')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FRA', N'France', N'FR', N'250')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FRO', N'Faroe Islands', N'FO', N'234')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FSM', N'Micronesia (the Federated States of)', N'FM', N'583')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GAB', N'Gabon', N'GA', N'266')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GBR', N'United Kingdom', N'GB', N'826')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GEO', N'Georgia', N'GE', N'268')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GGY', N'Guernsey', N'GG', N'831')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GHA', N'Ghana', N'GH', N'288')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GIB', N'Gibraltar', N'GI', N'292')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GIN', N'Guinea', N'GN', N'324')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GLP', N'Guadeloupe', N'GP', N'312')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GMB', N'Gambia', N'GM', N'270')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GNB', N'Guinea-Bissau', N'GW', N'624')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GNQ', N'Equatorial Guinea', N'GQ', N'226')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRC', N'Greece', N'GR', N'300')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRD', N'Grenada', N'GD', N'308')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRL', N'Greenland', N'GL', N'304')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GTM', N'Guatemala', N'GT', N'320')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUF', N'French Guiana', N'GF', N'254')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUM', N'Guam', N'GU', N'316')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUY', N'Guyana', N'GY', N'328')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GZA', N'Gaza Strip', N'GZ', N'NULL')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HKG', N'Hong Kong', N'HK', N'344')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HMD', N'Heard Island and McDonald Islands', N'HM', N'334')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HND', N'Honduras', N'HN', N'340')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HRV', N'Croatia', N'HR', N'191')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HTI', N'Haiti', N'HT', N'332')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HUN', N'Hungary', N'HU', N'348')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IDN', N'Indonesia', N'ID', N'360')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IMN', N'Isle of Man', N'IM', N'833')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IND', N'India', N'IN', N'356')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IOT', N'British Indian Ocean Territory', N'IO', N'86 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRL', N'Ireland', N'IE', N'372')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRN', N'Iran (the Islamic Republic of)', N'IR', N'364')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRQ', N'Iraq', N'IQ', N'368')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ISL', N'Iceland', N'IS', N'352')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ISR', N'Israel', N'IL', N'376')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ITA', N'Italy', N'IT', N'380')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JAM', N'Jamaica', N'JM', N'388')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JEY', N'Jersey', N'JE', N'832')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JOR', N'Jordan', N'JO', N'400')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JPN', N'Japan', N'JP', N'392')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KAZ', N'Kazakhstan', N'KZ', N'398')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KEN', N'Kenya', N'KE', N'404')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KGZ', N'Kyrgyzstan', N'KG', N'417')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KHM', N'Cambodia', N'KH', N'116')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KIR', N'Kiribati', N'KI', N'296')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KNA', N'Saint Kitts and Nevis', N'KN', N'659')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KOR', N'Korea (the Republic of)', N'KR', N'410')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KWT', N'Kuwait', N'KW', N'414')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LAO', N'Lao People''s Democratic Republic (the)', N'LA', N'418')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBN', N'Lebanon', N'LB', N'422')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBR', N'Liberia', N'LR', N'430')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBY', N'Libya', N'LY', N'434')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LCA', N'Saint Lucia', N'LC', N'662')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LIE', N'Liechtenstein', N'LI', N'438')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LKA', N'Sri Lanka', N'LK', N'144')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LSO', N'Lesotho', N'LS', N'426')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LTU', N'Lithuania', N'LT', N'440')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LUX', N'Luxembourg', N'LU', N'442')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LVA', N'Latvia', N'LV', N'428')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAC', N'Macao', N'MO', N'446')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAF', N'Saint Martin (French part)', N'MF', N'663')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAR', N'Morocco', N'MA', N'504')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MCO', N'Monaco', N'MC', N'492')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDA', N'Moldova (the Republic of)', N'MD', N'498')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDG', N'Madagascar', N'MG', N'450')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDV', N'Maldives', N'MV', N'462')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MEX', N'Mexico', N'MX', N'484')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MHL', N'Marshall Islands', N'MH', N'584')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MKD', N'Macedonia (the former Yugoslav Republic of)', N'MK', N'807')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MLI', N'Mali', N'ML', N'466')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MLT', N'Malta', N'MT', N'470')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MMR', N'Myanmar', N'MM', N'104')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNE', N'Montenegro', N'ME', N'499')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNG', N'Mongolia', N'MN', N'496')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNP', N'Northern Mariana Islands', N'MP', N'580')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MOZ', N'Mozambique', N'MZ', N'508')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MRT', N'Mauritania', N'MR', N'478')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MSR', N'Montserrat', N'MS', N'500')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MTQ', N'Martinique', N'MQ', N'474')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MUS', N'Mauritius', N'MU', N'480')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MWI', N'Malawi', N'MW', N'454')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MYS', N'Malaysia', N'MY', N'458')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MYT', N'Mayotte', N'YT', N'175')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NAM', N'Namibia', N'NA', N'516')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NCL', N'New Caledonia', N'NC', N'540')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NER', N'Niger', N'NE', N'562')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NFK', N'Norfolk Island', N'NF', N'574')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NGA', N'Nigeria', N'NG', N'566')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NIC', N'Nicaragua', N'NI', N'558')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NIU', N'Niue', N'NU', N'570')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NLD', N'Netherlands', N'NL', N'528')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NOR', N'Norway', N'NO', N'578')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NPL', N'Nepal', N'NP', N'524')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NRU', N'Nauru', N'NR', N'520')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NZL', N'New Zealand', N'NZ', N'554')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'OMN', N'Oman', N'OM', N'512')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PAK', N'Pakistan', N'PK', N'586')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PAN', N'Panama', N'PA', N'591')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PCN', N'Pitcairn', N'PN', N'612')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PER', N'Peru', N'PE', N'604')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PHL', N'Philippines', N'PH', N'608')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PLW', N'Palau', N'PW', N'585')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PNG', N'Papua New Guinea', N'PG', N'598')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'POL', N'Poland', N'PL', N'616')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRI', N'Puerto Rico', N'PR', N'630')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRK', N'Korea (the Democratic People''s Republic of)', N'KP', N'408')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRT', N'Portugal', N'PT', N'620')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRY', N'Paraguay', N'PY', N'600')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PSE', N'Palestine, State Of', N'PS', N'275')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PYF', N'French Polynesia', N'PF', N'258')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'QAT', N'Qatar', N'QA', N'634')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'REU', N'Réunion', N'RE', N'638')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ROU', N'Romania', N'RO', N'642')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'RUS', N'Russian Federation', N'RU', N'643')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'RWA', N'Rwanda', N'RW', N'646')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SAU', N'Saudi Arabia', N'SA', N'682')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SDN', N'Sudan', N'SD', N'729')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SEN', N'Senegal', N'SN', N'686')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SGP', N'Singapore', N'SG', N'702')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SGS', N'South Georgia and the South Sandwich Islands', N'GS', N'239')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SHN', N'Saint Helena Ascension And Tristan Da Cunha', N'SH', N'654')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SJM', N'Svalbard and Jan Mayen', N'SJ', N'744')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLB', N'Solomon Islands', N'SB', N'90 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLE', N'Sierra Leone', N'SL', N'694')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLV', N'El Salvador', N'SV', N'222')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SMR', N'San Marino', N'SM', N'674')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SOM', N'Somalia', N'SO', N'706')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SPM', N'Saint Pierre and Miquelon', N'PM', N'666')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SRB', N'Serbia', N'RS', N'688')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SSD', N'South Sudan ', N'SS', N'728')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'STP', N'Sao Tome and Principe', N'ST', N'678')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SUR', N'Suriname', N'SR', N'740')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SVK', N'Slovakia', N'SK', N'703')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SVN', N'Slovenia', N'SI', N'705')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SWE', N'Sweden', N'SE', N'752')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SWZ', N'Swaziland', N'SZ', N'748')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SXM', N'Sint Maarten (Dutch part)', N'SX', N'534')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SYC', N'Seychelles', N'SC', N'690')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SYR', N'Syrian Arab Republic', N'SY', N'760')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TCA', N'Turks and Caicos Islands', N'TC', N'796')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TCD', N'Chad', N'TD', N'148')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TGO', N'Togo', N'TG', N'768')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'THA', N'Thailand', N'TH', N'764')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TJK', N'Tajikistan', N'TJ', N'762')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TKL', N'Tokelau', N'TK', N'772')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TKM', N'Turkmenistan', N'TM', N'795')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TLS', N'Timor-Leste', N'TL', N'626')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TON', N'Tonga', N'TO', N'776')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TTO', N'Trinidad and Tobago', N'TT', N'780')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUN', N'Tunisia', N'TN', N'788')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUR', N'Turkey', N'TR', N'792')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUV', N'Tuvalu', N'TV', N'798')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TWN', N'Taiwan (Province of China)', N'TW', N'158')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TZA', N'Tanzania, United Republic Of', N'TZ', N'834')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UGA', N'Uganda', N'UG', N'800')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UKR', N'Ukraine', N'UA', N'804')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UMI', N'United States Minor Outlying Islands', N'UM', N'581')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'URY', N'Uruguay', N'UY', N'858')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'USA', N'United States', N'US', N'840')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UZB', N'Uzbekistan', N'UZ', N'860')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VAT', N'Holy See', N'VA', N'336')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VCT', N'Saint Vincent and the Grenadines', N'VC', N'670')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VEN', N'Venezuela, Bolivarian Republic Of', N'VE', N'862')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VGB', N'Virgin Islands (British)', N'VG', N'92 ')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VIR', N'Virgin Islands (U.S.)', N'VI', N'850')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VNM', N'Viet Nam', N'VN', N'704')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VUT', N'Vanuatu', N'VU', N'548')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'WLF', N'Wallis and Futuna', N'WF', N'876')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'WSM', N'Samoa', N'WS', N'882')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'YEM', N'Yemen', N'YE', N'887')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'YUG', N'Yugoslavia', N'YI', N'NULL')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZAF', N'South Africa', N'ZA', N'710')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZMB', N'Zambia', N'ZM', N'894')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZWB', N'Zambia', N'ZA', N'NULL')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZWE', N'Zimbabwe', N'ZW', N'716')
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (1, 4)
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (2, 4)
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (3, 4)
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (4, 4)
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (5, 4)
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 
GO
INSERT [dbo].[tblEmployee] ([EmpId], [EmpKey], [SSN], [EmpType], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [DateOfHire], [HomePhone], [DateOfFirstCase], [Gender], [HRSupervisor], [Enthnicity], [MaritalStatus], [Dependents], [City], [Country], [TaxState], [ZipCode], [EmgContact], [EmgPhone], [Municipality], [Notes], [EmpStatus], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (4, N'TEST10023', N'TEST10023', 1, N'Rakesh', NULL, N'Gangwar', CAST(N'2022-03-07T07:58:41.000' AS DateTime), N'rakesh@gmail.com', N'9027972157', CAST(N'2022-03-07T18:30:00.000' AS DateTime), N'9027972157', CAST(N'2022-03-15T18:30:00.000' AS DateTime), N'1', NULL, 3, 1, 1, N'Asian', N'USA', N'US', N'243001', N'9027972157', N'9027972157', NULL, N'Test', 1, 0, CAST(N'2022-03-23T13:29:34.847' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpType] ON 
GO
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'Applicant HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
GO
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
GO
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'HHA, PCA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
GO
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, N'Nurses Aide', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
GO
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, N'RN', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblEmpType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaster] ON 
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (1, 1, 1, N'Active', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (2, 1, 2, N'Deferred', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (3, 1, 3, N'Pending', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (4, 1, 4, N'Inactive', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (5, 2, 1, N'Single', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (6, 2, 2, N'Married', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (7, 2, 3, N'Widow', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (8, 3, 1, N'Male', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (9, 3, 2, N'Female', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (10, 3, 3, N'Other', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (11, 4, 1, N'White', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (12, 4, 2, N'Hispanic', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (13, 4, 3, N'Asian', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (14, 4, 4, N'Black', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (15, 4, 5, N'Native American', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (16, 4, 6, N'Pacific Islander', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (17, 4, 7, N'Other', 1)
GO
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (18, 4, 8, N'I do not wish to disclose', 1)
GO
SET IDENTITY_INSERT [dbo].[tblMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMasterType] ON 
GO
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (1, N'EmployeeStatus')
GO
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (2, N'MaritalStatus')
GO
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (3, N'Gender')
GO
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (4, N'Ethnicity')
GO
SET IDENTITY_INSERT [dbo].[tblMasterType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMeeting] ON 
GO
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [CreatedOn], [CreatedBy]) VALUES (1, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'15:51:00' AS Time), CAST(N'18:56:00' AS Time), N'Testing', CAST(N'2022-03-26T16:03:50.947' AS DateTime), 1)
GO
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [CreatedOn], [CreatedBy]) VALUES (2, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'09:09:00' AS Time), CAST(N'11:19:00' AS Time), N'hellloo', CAST(N'2022-03-27T11:10:31.897' AS DateTime), 1)
GO
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [CreatedOn], [CreatedBy]) VALUES (3, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'08:10:00' AS Time), CAST(N'10:10:00' AS Time), N'gffggf', CAST(N'2022-03-27T11:12:57.953' AS DateTime), 1)
GO
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [CreatedOn], [CreatedBy]) VALUES (4, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'10:15:00' AS Time), CAST(N'11:25:00' AS Time), N'dfddf', CAST(N'2022-03-27T11:29:10.650' AS DateTime), 1)
GO
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [MeetingNote], [CreatedOn], [CreatedBy]) VALUES (5, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'11:30:00' AS Time), CAST(N'12:30:00' AS Time), N'fgfg', CAST(N'2022-03-27T11:31:08.587' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblMeeting] OFF
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Australian Antarctic Territory')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Australian Capital Territory')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Christmas Island')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Cocos (Keeling) Islands')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Coral Sea Islands')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Heard Island and McDonald Islands')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Jervis Bay Territory')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'New South Wales')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Norfolk Island')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Northern Territory')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Queensland')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'South Australia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Tasmania')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Victoria')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Western Australia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Alabama')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Alaska')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Arizona')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Arkansas')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'California')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Colorado')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Connecticut')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Delaware')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Florida')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Georgia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Hawaii')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Idaho')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Illinois')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Indiana')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Iowa')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Kansas')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Kentucky')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Louisiana')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Maine')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Maryland')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Massachusetts')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Michigan')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Minnesota')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Mississippi')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Missouri')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Montana')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Nebraska')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Nevada')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Hampshire')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Jersey')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Mexico')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New York')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'North Carolina')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'North Dakota')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Ohio')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Oklahoma')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Oregon')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Pennsylvania')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Rhode Island')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'South Carolina')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'South Dakota')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Tennessee')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Texas')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Utah')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Vermont')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Virginia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Washington')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'West Virginia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Wisconsin')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Wyoming')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Auckland')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'New Plymouth')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Wellington')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Nelson')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Marlborough')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Westland')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Canterbury')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Otago')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Southland')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Carlow')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Cavan')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Clare')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Cork')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Donegal')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Dublin')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Galway')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kerry')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kildare')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kilkenny')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Laois')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Leitrim')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Limerick')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Longford')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Louth')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Mayo')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Meath')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Monaghan')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Offaly')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Roscommon')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Sligo')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Tipperary NR')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Tipperary SR')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Waterford')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Westmeath')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Wexford')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Wicklow')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'Us', N'Columbia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'Us', N'District of Columbia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Alberta')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'British Columbia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Manitoba')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'New Brunswick')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Newfoundland and Labrador')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Nova Scotia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Ontario')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Prince Edward Island')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Quebec')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Saskatchewan')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'PRT', N'PT', N'Lisbon')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Seoul')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Chungcheong')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Chungcheong')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Gangwon')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Gyeonggi')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Gyeongsang')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Gyeongsang')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Jeolla')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Jeolla')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Jeju')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Ulsan')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Angermannia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Bahusia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Blechingia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Dalecarlia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Dalia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Gestricia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Gotlandia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Hallandia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Helsingia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Herdalia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Jemtia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Lapponia Suecana')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Medelpadia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Nericia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Norbothnia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Olandia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Ostrogothia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Scania')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Smolandia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Sudermannia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Uplandia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Wermlandia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westmannia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westrobothnia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westrogothia')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'GBR', N'GB', N'Surrey')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'GBR', N'GB', N'Cornwall')
GO
/****** Object:  Index [INDX_tblClientMeeting]    Script Date: 28-03-2022 10:38:13 ******/
CREATE NONCLUSTERED INDEX [INDX_tblClientMeeting] ON [dbo].[tblClientMeeting]
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblMaster] ADD  CONSTRAINT [DF_tblMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblEmpClientMeeting]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpClientMeeting_tblEmployee] FOREIGN KEY([EmpId])
REFERENCES [dbo].[tblEmployee] ([EmpId])
GO
ALTER TABLE [dbo].[tblEmpClientMeeting] CHECK CONSTRAINT [FK_tblEmpClientMeeting_tblEmployee]
GO
ALTER TABLE [dbo].[tblEmpClientMeeting]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpClientMeeting_tblMeeting] FOREIGN KEY([MeetingId])
REFERENCES [dbo].[tblMeeting] ([MeetingId])
GO
ALTER TABLE [dbo].[tblEmpClientMeeting] CHECK CONSTRAINT [FK_tblEmpClientMeeting_tblMeeting]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblEmployee] FOREIGN KEY([HRSupervisor])
REFERENCES [dbo].[tblEmployee] ([EmpId])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblEmployee]
GO
ALTER TABLE [dbo].[tblLogin]  WITH CHECK ADD  CONSTRAINT [FK_tblLogin_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblLogin] CHECK CONSTRAINT [FK_tblLogin_tblUser]
GO
ALTER TABLE [dbo].[tblMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblMaster_tblMasterType] FOREIGN KEY([MasterType])
REFERENCES [dbo].[tblMasterType] ([MasterITyped])
GO
ALTER TABLE [dbo].[tblMaster] CHECK CONSTRAINT [FK_tblMaster_tblMasterType]
GO
/****** Object:  StoredProcedure [dbo].[EmpProc]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpProc]

(
@flag INT=null
)
AS

BEGIN

if @flag=1
BEGIN

SELECT x.EmpId,(ISNULL(x.FirstName,'') + ' ' +   ISNULL(x.MiddleName,'') + ' ' + ISNULL(x.LastName,'') ) EmpName,z.TypeId,z.TypeName as EmpType, 
x.CellPhone,x.SSN,x.TaxState,x.EmpKey,x.EmpStatus,
(Case When x.Email IS NOT NULL Then 1 ELSE 0 END) HasEmail,  
(Case When x.DOB IS NOT NULL Then 1 ELSE 0 END) HasDOB,y.EmpId as ManagerId,
(ISNULL(y.FirstName,'') + ' ' +   ISNULL(y.MiddleName,'') + ' ' + ISNULL(y.LastName,'') ) Coordinator
From tblEmployee x left join tblEmployee y on x.HRSupervisor=y.EmpId
left join tblEmpType z on x.EmpType=z.TypeId
where x.IsDeleted=0;


END



END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_EMPLOYEE]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_EMPLOYEE]
(
@EMPID INT
)
AS
BEGIN

	Update tblEmployee SET IsDeleted = 1 Where EmpId = @EMPID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_ClientMeetings]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_GET_ClientMeetings]
(
@StartDate DATETIME = null,
@ClientID INT = 0
)
AS
BEGIN
	
	SELECT 
		InnerBlock.*
	From
	(
	SELECT
		CL.ClientId,
		CL.ExtClientId,
		CL.FirstName,
		CL.MiddleName,
		CL.LastName,
		CL.CellPhone,
		CL.Email,
		CL.City,
		CL.ClassCordinator,
		CL.Country,
		CL.CState,
		CL.ZipCode,
		CM.MeetingId,
		CM.MeetingNote ,
		CM.MeetingDate ,
		CM.MeetingStartHrsTime,
		CM.MeetingStartMinsTime,
		CM.MeetingEndHrsTime ,
		CM.MeetingEndMinsTime,
		CM.TotalMeetingHrs ,
		CM.TotalMeetingMins,
		CM.StartTimeType, 
		CM.EndTimeType,
		(Case When CM.StartTimeType = 'AM' THEN 0 ELSE 1 END) MeetingOrder,
		CM.MeetingDate MeetingStartDate,
		(CAST(CM.MeetingStartHrsTime As VARCHAR(2)) + ' : ' + (CASE When CM.MeetingStartMinsTime = 0 THEN '00' ELSE CAST(CM.MeetingStartMinsTime As VARCHAR(2)) END) + ' ' + CM.StartTimeType) StartTime,
		(CAST(CM.MeetingEndHrsTime As VARCHAR(2)) + ' : ' + (CASE When CM.MeetingEndMinsTime = 0 THEN '00' ELSE CAST(CM.MeetingEndMinsTime As VARCHAR(2)) END) + ' ' + CM.EndTimeType) EndTime,
		CM.ClientID As MClientId
	FROM tblClient CL
		Left Outer Join tblClientMeeting CM
	On (CM.ClientId = CL.ClientId)
	Where ISNULL(CM.MeetingDate, @StartDate ) >= 	 @StartDate 
	AND CL.ClientId = 
		(
			Case 
				When @ClientID = 0  THEN CL.ClientId
				ELSE @ClientID
			END 
		)
	) As InnerBlock
	;


END

GO
/****** Object:  StoredProcedure [dbo].[SP_GET_CLIENTS]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_CLIENTS]
AS
BEGIN

SELECT
	ClientId,
	ExtClientId,
	FirstName ClientName
From tblClient
;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EmployeeInfoByID]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_GET_EmployeeInfoByID]
(
@EID INT
)
AS
BEGIN
	
	Select 
		EmpId,
		Email,
		FirstName,
		MiddleName,
		LastName,
		CellPhone,
		HomePhone,
		DateOfHire,
		DateOfFirstCase,
		DOB,
		SSN,
	
		Gender,
		City,
		Country,
	
		ZipCode,
		EmgContact,
		EmgPhone
	From tblEmployee
	Where EmpId = @EID
	;


END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_EMPLOYEES]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_EMPLOYEES]
AS
BEGIN

SELECT
	EmpId,
	(ISNULL(FirstName,'') + ' ' +   ISNULL(MiddleName,'') + ' ' + ISNULL(LastName,'') ) EmpName,  
	CellPhone,
	(Case When Email IS NOT NULL Then 1 ELSE 0 END) HasEmail,  
	(Case When DOB IS NOT NULL Then 1 ELSE 0 END) HasDOB
	
From tblEmployee
WHERE IsDeleted = 0
;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_STUDENTINFO]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_STUDENTINFO]
AS
BEGIN

SELECT
	*
	FROM STUDENT S INNER JOIN COURSE C
	ON (S.CID = C.CID)
;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDeclinedCaseProc]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_GetDeclinedCaseProc]    
(    
@EmpId int = 0    
  
)    
AS    
BEGIN    
 select (cast(format(ReportedDate, 'd', 'en-US') as varchar)) as ReportedDate,DeclinedReason,    
 cast(format(AssignmentStartDate, 'd', 'en-US') as varchar) as AssignmentStartDate,Day,Week,Note,    
 (tc.FirstName+' '+tc.MiddleName+' '+tc.LastName) as Name,'' as CaseType from    
  tblEmpDeclinedCase tedc left join tblClient tc on tedc.ClientId=tc.ClientId    
  where  tedc.EmpId= @EmpId  
      
 --where empId= @EmployeeId or Clientid=@ClientID    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPayRateProc]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[SP_GetPayRateProc]
(
@EmployeeId bigint = 0,
@ClientID bigint = 0
)
AS
BEGIN
	select (cast(format(EffectiveDate, 'd', 'en-US') as varchar)+'-'+CAST(format(EndDate, 'd', 'en-US') as varchar)) as EffectiveDate,(cast(Hourly as varchar)+'-'+cast(liveIn as varchar)+'-'+cast(Visit as varchar)) as Regulartime
	,(CAST(OverHourly as varchar)+'-'+CAST(OverLiveIn as varchar)+'-'+CAST(OverVisit as varchar)) as OverTime,Description from tblPayRate 
	--where empId= @EmployeeId or Clientid=@ClientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_CLIENT]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE   PROCEDURE [dbo].[SP_SAVE_CLIENT]  
(  
	@BillTo VARCHAR(50),   
	@FirstName VARCHAR(50),  
	@MiddleName VARCHAR(50),  
	@LastName VARCHAR(50),  
	@CellPhone VARCHAR(50),  
	@Ethnicity VARCHAR(50),  
	@Email VARCHAR(50),  
	@InsurenceId VARCHAR(50),  
	@OfChild VARCHAR(50),  
	@SSN VARCHAR(50),  
	@ExtClientId VARCHAR(50),  
	@Gender VARCHAR(50),  
	@Nurse VARCHAR(50),  
	@ClassCordinator VARCHAR(50),  
	@MaritalStatus VARCHAR(50),  
	@City VARCHAR(50),  
	@Country VARCHAR(50),  
	@CState VARCHAR(50),  
	@ZipCode VARCHAR(50),  
	@ReferredBy VARCHAR(50),  
	@EmgContact VARCHAR(50),  
	@CaseWorkerPhone VARCHAR(50),  
	@CaseWorkerEmail VARCHAR(50),  
	@IsActive INT,
	@EmgPhone varchar(50)='',
	@EmgEmail varchar(50)=''
)  
AS  
BEGIN  
  
Insert Into tblClient  
(BillTo ,  FirstName,  MiddleName,  LastName,  CellPhone
,Ethnicity,  Email,  InsurenceId,  OfChild,  SSN,  ExtClientId,  Gender,  Nurse,  ClassCordinator  
,MaritalStatus,  City,  Country,  CState,  ZipCode,  ReferredBy,  EmgContact ,  CaseWorkerPhone 
,CaseWorkerEmail ,IsActive,EnteredDate
,EmgPhone,EmgEmail)  
Values  
(@BillTo , @FirstName, @MiddleName, @LastName, @CellPhone
,@Ethnicity, @Email, @InsurenceId, @OfChild, @SSN, @ExtClientId, @Gender, @Nurse, @ClassCordinator  
, @MaritalStatus, @City, @Country, @CState, @ZipCode, @ReferredBy, @EmgContact , @CaseWorkerPhone
 ,@CaseWorkerEmail ,@IsActive, GETUtcDATE()
 ,@EmgPhone,@EmgEmail)  

  
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_Employee]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SAVE_Employee]
(
@FirstName VARCHAR(50),
@MiddleName VARCHAR(50),
@LastName VARCHAR(50),
@CellPhone VARCHAR(50),
@HomePhone VARCHAR(50),
@Email VARCHAR(50),
@DateOfHire VARCHAR(50),
@DateOfFirstCase VARCHAR(50),
@DOB VARCHAR(50),
@SSN VARCHAR(50),
@ExtEmpId VARCHAR(50),
@Gender VARCHAR(50),
@HRSupervisor VARCHAR(50),
@Enthnicity VARCHAR(50),
@MaritalStatus VARCHAR(50),
@City VARCHAR(50),
@Country VARCHAR(50),
@CState VARCHAR(50),
@ZipCode VARCHAR(50),
@EmgContact VARCHAR(50),
@EmgPhone VARCHAR(50),
@IsActive INT
)
AS
BEGIN

Insert Into tblEmployee
(FirstName,  MiddleName,  LastName,  CellPhone, HomePhone ,Email,  DateOfHire,  DateOfFirstCase, DOB,  SSN,  ExtEmpId,  Gender,  HRSupervisor,  Enthnicity  ,  MaritalStatus,  City,  Country,  CState,  ZipCode,  EmgContact ,  EmgPhone,  IsActive, EnteredDate, IsDeleted)
Values
(@FirstName, @MiddleName, @LastName, @CellPhone, @HomePhone, @Email, @DateOfHire, @DateOfFirstCase, @DOB, @SSN, @ExtEmpId, @Gender, @HRSupervisor, @Enthnicity  , @MaritalStatus, @City, @Country, @CState, @ZipCode, @EmgContact , @EmgPhone  , @IsActive, GETDATE(), 0)
;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpDeclinedCaseProc]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE   PROCEDURE [dbo].[SP_SaveEmpDeclinedCaseProc]  
(  
@ReportedDate date,@ClientID bigint,@caseid bigint,@DeclinedReason varchar(max),@AssignmentStartDate date,@Day int,@Week int,
@EmpId int,  
@Note varchar(max),@CreatedOn datetime,  
@createdBy int--,@Casetype varchar(50),@Result varchar(max)  
  
)  
AS  
BEGIN  
   
   
 insert into tblEmpDeclinedCase(EmpId,ReportedDate,ClientId,CaseId,DeclinedReason,AssignmentStartDate,Day,Week,Note,  
 CreatedOn,CreatedBy)  
 values(@EmpId,@ReportedDate,@ClientID,@caseid,@DeclinedReason,@AssignmentStartDate,@Day,@Week,@Note,@CreatedOn,@createdBy)  
  
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpPayRateProc]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_SaveEmpPayRateProc]
(
@EmployeeId bigint = 0,@ClientID bigint = 0,@EffectiveDate datetime,@EndDate datetime,@Description varchar(max),
@Note varchar(max),@Hourly decimal,@LiveIn decimal,@Visit decimal,@OverHourly decimal,@OverLiveIn decimal,@OverVisit decimal,
@IncludedHour decimal,@AdditionalHour decimal,@Mileage decimal,@TravelTime decimal,@Gas decimal,@Extra decimal,@CreatedOn datetime,
@createdBy int--,@Casetype varchar(50),@Result varchar(max)

)
AS
BEGIN
	
	
	insert into tblPayRate(EmpId,EffectiveDate,EndDate,ClientId,Description,Notes,Hourly,LiveIn,Visit,
	OverHourly,OverLiveIn,OverVisit,IncludedHour,AdditionalHour,Mileage,TravelTime,Gas,Extra,CreatedOn,CreatedBy)
	values(@EmployeeId,@EffectiveDate,@EndDate,@ClientID,@Description,@Note,@Hourly,@LiveIn,@Visit,
	@OverHourly,@OverLiveIn,@OverVisit,@IncludedHour,@AdditionalHour,@Mileage,@TravelTime,@Gas,@Extra,@CreatedOn,@createdBy)



END




GO
/****** Object:  StoredProcedure [dbo].[SP_SCHEDULE_CLIENT_MEETING]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_SCHEDULE_CLIENT_MEETING]
(
@MeetingNote NVARCHAR(500),
@MeetingDate DATETIME,
@MeetingStartHrsTime INT,
@MeetingStartMinsTime INT,
@MeetingEndHrsTime INT,
@MeetingEndMinsTime INT,
@TotalMeetingHrs INT,
@TotalMeetingMins INT,
@ClientID INT,
@StartTimeType CHAR(2),
@EndTimeType CHAR(2)
)
AS
BEGIN
	
	Insert Into tblClientMeeting
	(
		MeetingNote , MeetingDate ,MeetingStartHrsTime,MeetingStartMinsTime,MeetingEndHrsTime ,MeetingEndMinsTime,TotalMeetingHrs ,
		TotalMeetingMins, ClientID,StartTimeType, EndTimeType, EnteredDate
	) 
	values
	(
	@MeetingNote, @MeetingDate, @MeetingStartHrsTime, @MeetingStartMinsTime, @MeetingEndHrsTime, @MeetingEndMinsTime, @TotalMeetingHrs,
		@TotalMeetingMins, @ClientID, @StartTimeType, @EndTimeType, GETDATE()
	);

END

GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDATE_LOGIN]    Script Date: 28-03-2022 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_VALIDATE_LOGIN]
(
@UNAME VARCHAR(50),
@PWD VARCHAR(50),
@LID INT out
)
AS
BEGIN

SELECT
	@LID = LoginId
FROM tblLogin
WHERE UserName = @UNAME
AND UPassword = @PWD
;

END
GO
USE [master]
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  READ_WRITE 
GO
