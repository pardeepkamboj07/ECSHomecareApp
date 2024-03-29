USE [master]
GO
/****** Object:  Database [ESHomeCareDB.IND]    Script Date: 13-04-2022 18:10:48 ******/
CREATE DATABASE [ESHomeCareDB.IND]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESHomeCareDB.IND', FILENAME = N'D:\rdsdbdata\DATA\ESHomeCareDB.IND.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ESHomeCareDB.IND_log', FILENAME = N'D:\rdsdbdata\DATA\ESHomeCareDB.IND_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [ESHomeCareDB.IND] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ESHomeCareDB.IND] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ESHomeCareDB.IND]
GO
/****** Object:  User [admin]    Script Date: 13-04-2022 18:10:51 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[tblActivityMaster]    Script Date: 13-04-2022 18:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivityMaster](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityText] [varchar](100) NULL,
	[ActivityStatus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 13-04-2022 18:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[EmpId] [int] NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 13-04-2022 18:10:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAvailabilityMaster]    Script Date: 13-04-2022 18:10:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCases]    Script Date: 13-04-2022 18:10:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClient]    Script Date: 13-04-2022 18:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClient](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[BillTo] [varchar](50) NULL,
	[Nurse] [int] NULL,
	[OfChild] [tinyint] NULL,
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
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblClient] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientSatus]    Script Date: 13-04-2022 18:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientSatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[ReferralCodeId] [int] NOT NULL,
	[note] [varchar](100) NULL,
	[clientId] [int] NOT NULL,
	[OfficeUserId] [int] NOT NULL,
	[ReferaalUserID] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Createdon] [datetime] NOT NULL,
	[TextCheck] [bit] NULL,
	[ScreenCheck] [bit] NULL,
	[EmailCheck] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompliance]    Script Date: 13-04-2022 18:10:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContact]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ContactType] [tinyint] NULL,
	[ContactName] [varchar](50) NULL,
	[Relationship] [varchar](50) NULL,
	[ContactPhone] [varchar](50) NULL,
	[ContactEmail] [varchar](50) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblContact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 13-04-2022 18:10:53 ******/
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
/****** Object:  Table [dbo].[tblEmpClientMeeting]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDeclined]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpDeclined](
	[DeclinedId] [bigint] IDENTITY(1,1) NOT NULL,
	[ReportedDate] [datetime] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[EmpId] [bigint] NOT NULL,
	[CaseType] [tinyint] NOT NULL,
	[Reason] [varchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[Notes] [varchar](max) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
 CONSTRAINT [PK__tblEmpDe__437174720DBC8829] PRIMARY KEY CLUSTERED 
(
	[DeclinedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDeclinedCase]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpDocument]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpDocument](
	[Documentid] [bigint] IDENTITY(1,1) NOT NULL,
	[FolderId] [bigint] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[FilePath] [varchar](100) NULL,
	[Title] [varchar](50) NOT NULL,
	[SeachTag] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreateOn] [bigint] NOT NULL,
 CONSTRAINT [PK_tblEmpDocument] PRIMARY KEY CLUSTERED 
(
	[Documentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[EmpType] [tinyint] NOT NULL,
	[DateOfHire] [datetime] NOT NULL,
	[DateOfFirstCase] [datetime] NULL,
	[Dependents] [tinyint] NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[TaxState] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Municipality] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[IsActive] [tinyint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatus]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusMaster]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpStatusScheduling]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpType]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFolderMaster]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFolderMaster](
	[FolderId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[FolderName] [varchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreateBy] [bigint] NOT NULL,
 CONSTRAINT [PK_tblFolderMaster] PRIMARY KEY CLUSTERED 
(
	[FolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIncident]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMaster]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMasterType]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedication]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedication](
	[MedicationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Medication] [varchar](100) NULL,
	[NDC] [varchar](100) NULL,
	[Strength] [varchar](100) NULL,
	[Dosage] [varchar](100) NULL,
	[Frequency] [tinyint] NULL,
	[Route] [varchar](100) NULL,
	[Tabs] [varchar](100) NULL,
	[Prescriber] [varchar](100) NULL,
	[Classification] [varchar](255) NULL,
	[Instructions] [varchar](255) NULL,
	[IsReminders] [bit] NOT NULL,
	[IsInstructionscheck] [bit] NOT NULL,
	[Isadministrationcheck] [bit] NOT NULL,
	[Isselfadministercheck] [bit] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK__tblClien__62EC1ADA5A17F3DD] PRIMARY KEY CLUSTERED 
(
	[MedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeeting]    Script Date: 13-04-2022 18:10:53 ******/
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
	[IsStatus] [tinyint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblMeeting] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeetingLog]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeetingLog](
	[MeetingId] [bigint] NULL,
	[Status] [tinyint] NULL,
	[ChangeBy] [int] NULL,
	[ChangeOn] [datetime] NULL,
	[Text] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMeetingPoint]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeetingPoint](
	[PointId] [bigint] IDENTITY(1,1) NOT NULL,
	[MeetingId] [bigint] NOT NULL,
	[MeetingPoint] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_tblMeetingPoint] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOfficeUserMaster]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayRate]    Script Date: 13-04-2022 18:10:53 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProvider]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProvider](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProviderType] [tinyint] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[License] [varchar](50) NULL,
	[LicenseExpires] [datetime] NULL,
	[NPINumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Address] [varchar](50) NOT NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblProvider] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServiceTask]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServiceTask](
	[TaskSrvId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[Frequency] [tinyint] NOT NULL,
	[ServiceNote] [varchar](500) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblServiceTask] PRIMARY KEY CLUSTERED 
(
	[TaskSrvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStates]    Script Date: 13-04-2022 18:10:53 ******/
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
/****** Object:  Table [dbo].[tblTaskMaster]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskMaster](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskCode] [varchar](3) NOT NULL,
	[TaskName] [varchar](50) NOT NULL,
	[TaskDetail] [varchar](500) NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblTaskMaster] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserKey] [varchar](50) NULL,
	[UserType] [tinyint] NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
	[SSN] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[CellPhone] [varchar](50) NULL,
	[HomePhone] [varchar](50) NULL,
	[EmgPhone] [varchar](50) NULL,
	[EmgContact] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[MaritalStatus] [tinyint] NULL,
	[Ethnicity] [tinyint] NULL,
	[SupervisorId] [int] NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 13-04-2022 18:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_tblUserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblActivityMaster] ON 

INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (1, N'Admission', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (2, N'Start of Care', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (3, N'Change', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (4, N'Hold', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (5, N'Resume', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (6, N'Re-Admission', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (7, N'Pending', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (8, N'Deferred', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (9, N'Discharge', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (10, N'Hospital', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (11, N'Tour Scheduled', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (12, N'Assessment Scheduled', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (13, N'Declined', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (14, N'Withdrawn', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (15, N'First Contacted', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (16, N'First Billed', 1)
INSERT [dbo].[tblActivityMaster] ([ActivityId], [ActivityText], [ActivityStatus]) VALUES (17, N'Teach and Train', 1)
SET IDENTITY_INSERT [dbo].[tblActivityMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAddress] ON 

INSERT [dbo].[tblAddress] ([AddressId], [UserId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (1, 2, 4, 1, N'Rakesh Kumar ', N'253', N'Testt', N'Bareilly', N'India', N'UP', N'243001', CAST(N'2022-03-29T04:44:28.070' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (2, 10, 10, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(N'2022-04-09T08:22:42.117' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (3, 10, 10, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(N'2022-04-12T11:43:46.823' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (4, 10, 10, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(N'2022-04-12T11:43:46.820' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (5, 10, 10, 1, N'bhashkar', N'4', N'14fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(N'2022-04-12T11:43:46.913' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (6, 10, 10, 1, N'bhashkar', N'4', N'15fc road new york', N'new york', N'united state', N'new york', N'273207', CAST(N'2022-04-12T11:43:54.040' AS DateTime), 1)
INSERT [dbo].[tblAddress] ([AddressId], [UserId], [EmpId], [AddressType], [Owner], [FlatNo], [Address], [City], [Country], [State], [ZipCode], [CreatedOn], [CreatedBy]) VALUES (7, 0, 0, 1, N'bhashkar', N'5', N'senfrancisco united state', N'new york', N'united state', N'new york', N'273207', CAST(N'2022-04-12T17:08:25.153' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAttendance] ON 

INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (1, 4, 1, CAST(N'2022-03-15T05:04:28.000' AS DateTime), CAST(N'2022-03-15T05:04:28.000' AS DateTime), N'test', CAST(N'2022-03-29T05:05:05.003' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (2, 4, 1, CAST(N'2022-04-01T12:43:17.000' AS DateTime), CAST(N'2022-04-02T12:43:17.000' AS DateTime), N'fggdrfg', CAST(N'2022-04-03T12:45:07.407' AS DateTime), 0)
INSERT [dbo].[tblAttendance] ([AttendanceId], [EmpId], [Reason], [StartDate], [EndDate], [Notes], [CreatedOn], [CreatedBy]) VALUES (3, 10, 3, CAST(N'2022-04-01T08:19:43.000' AS DateTime), CAST(N'2022-04-03T08:19:43.000' AS DateTime), N'dgbjhhgh', CAST(N'2022-04-09T08:20:38.107' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblAttendance] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAvailabilityMaster] ON 

INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (1, N'Will work with children')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (2, N'Will work with smokers')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (3, N'Will work with pets')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (4, N'Will work with cats')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (5, N'Will work with dogs')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (6, N'Will work alt weekends')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (7, N'Will work with Kosher kitchen')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (8, N'Experience with Hoyer Lift')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (9, N'Will work weekends only')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (10, N'Will work mornings')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (11, N'Will work live-in')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (12, N'Will work nights')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (13, N'Will work afternoons')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (14, N'Will work Light Duty')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (15, N'Has car')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (16, N'Speaks English')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (17, N'Primary Language')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (18, N'Second Language')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (19, N'Third Language')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (20, N'Seeking Employment')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (21, N'As of Date')
INSERT [dbo].[tblAvailabilityMaster] ([AvailabilityId], [AvailabilityName]) VALUES (22, N'Will work live-in on weekends')
SET IDENTITY_INSERT [dbo].[tblAvailabilityMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClient] ON 

INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, 2, NULL, 4, 1, N'rakesh', N'rakesh1', N'rakesh2', N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-03-23T17:32:38.897' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, 3, NULL, 4, 2, N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-04-06T18:40:07.697' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, 5, NULL, 5, 1, NULL, NULL, NULL, N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-04-07T16:44:39.473' AS DateTime), 1)
INSERT [dbo].[tblClient] ([ClientId], [UserId], [BillTo], [Nurse], [OfChild], [AltId], [ID2], [ID3], [InsuranceID], [WorkerName], [WorkerContact], [ReferredBy], [IsHourly], [TimeSlip], [PriorityCode], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, 6, NULL, 5, 1, NULL, NULL, NULL, N'rakesh123', N'rakesh', N'9027972157', N'Rakesh', 1, 1, 1, 1, CAST(N'2022-04-07T16:45:02.720' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblClient] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClientSatus] ON 

INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (1, 1, CAST(N'2022-04-18T04:45:00.000' AS DateTime), 2, N'test', 2, 4, 4, 0, CAST(N'2022-04-07T10:15:35.447' AS DateTime), 1, 1, 1)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (2, 12, CAST(N'2022-04-28T07:57:14.000' AS DateTime), 7, N'test11', 2, 4, 4, 0, CAST(N'2022-04-07T13:28:09.353' AS DateTime), 1, 1, 1)
INSERT [dbo].[tblClientSatus] ([StatusId], [ActivityID], [StatusDate], [ReferralCodeId], [note], [clientId], [OfficeUserId], [ReferaalUserID], [CreatedBy], [Createdon], [TextCheck], [ScreenCheck], [EmailCheck]) VALUES (3, 1, CAST(N'2022-04-01T16:59:24.000' AS DateTime), 3, N'test', 11, 10, 10, 0, CAST(N'2022-04-12T17:07:41.990' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tblClientSatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCompliance] ON 

INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (1, 4, CAST(N'2022-03-15T05:06:24.000' AS DateTime), CAST(N'2022-03-09T05:06:24.000' AS DateTime), N'Test', N'Test', N'', 4, N'TestTest', CAST(N'2022-03-29T05:06:58.353' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (2, 4, CAST(N'2022-03-24T05:08:14.000' AS DateTime), CAST(N'2022-03-17T05:08:14.000' AS DateTime), N'Test', N'Test', N'Test', 4, N'TestTestTest', CAST(N'2022-03-29T05:08:30.727' AS DateTime), 0)
INSERT [dbo].[tblCompliance] ([ComplianceId], [EmpId], [DueDate], [CompletedOn], [Category], [Code], [Result], [Nurse], [Notes], [CreatedOn], [CreatedBy]) VALUES (3, 10, CAST(N'2022-03-02T18:30:00.000' AS DateTime), CAST(N'2022-04-01T11:37:59.000' AS DateTime), N'test', N'123', N'pass', 7, N'jyfcytchgf', CAST(N'2022-04-08T11:52:47.877' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblCompliance] OFF
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ABW', N'Aruba', N'AW', N'533')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AFG', N'Afghanistan', N'AF', N'4  ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AGO', N'Angola', N'AO', N'24 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AIA', N'Anguilla', N'AI', N'660')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ALA', N'Åland Islands', N'AX', N'248')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ALB', N'Albania', N'AL', N'8  ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AND', N'Andorra', N'AD', N'20 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ANT', N'Netherlands Antilles', N'NT', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARE', N'United Arab Emirates', N'AE', N'784')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARG', N'Argentina', N'AR', N'32 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ARM', N'Armenia', N'AM', N'51 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ASM', N'American Samoa', N'AS', N'16 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATA', N'Antarctica', N'AQ', N'10 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATF', N'French Southern Territories', N'TF', N'260')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ATG', N'Antigua and Barbuda', N'AG', N'28 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AUS', N'Australia', N'AU', N'36 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AUT', N'Austria', N'AT', N'40 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'AZE', N'Azerbaijan', N'AZ', N'31 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BDI', N'Burundi', N'BI', N'108')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BEL', N'Belgium', N'BE', N'56 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BEN', N'Benin', N'BJ', N'204')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BES', N'Bonaire Sint Eustatius And Saba', N'BQ', N'535')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BFA', N'Burkina Faso', N'BF', N'854')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BGD', N'Bangladesh', N'BD', N'50 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BGR', N'Bulgaria', N'BG', N'100')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BHR', N'Bahrain', N'BH', N'48 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BHS', N'Bahamas', N'BS', N'44 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BIH', N'Bosnia and Herzegovina', N'BA', N'70 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLM', N'Saint Barthélemy', N'BL', N'652')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLR', N'Belarus', N'BY', N'112')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BLZ', N'Belize', N'BZ', N'84 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BMU', N'Bermuda', N'BM', N'60 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BOL', N'Bolivia, Plurinational State Of', N'BO', N'68 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRA', N'Brazil', N'BR', N'76 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRB', N'Barbados', N'BB', N'52 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BRN', N'Brunei Darussalam', N'BN', N'96 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BTN', N'Bhutan', N'BT', N'64 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BVT', N'Bouvet Island', N'BV', N'74 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'BWA', N'Botswana', N'BW', N'72 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CAF', N'Central African Republic', N'CF', N'140')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CAN', N'Canada', N'CA', N'124')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CCK', N'Cocos (Keeling) Islands', N'CC', N'166')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHE', N'Switzerland', N'CH', N'756')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHL', N'Chile', N'CL', N'152')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CHN', N'China', N'CN', N'156')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CIV', N'Côte d''Ivoire', N'CI', N'384')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CMR', N'Cameroon', N'CM', N'120')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COD', N'Congo (the Democratic Republic of the)', N'CD', N'180')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COG', N'Congo', N'CG', N'178')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COK', N'Cook Islands', N'CK', N'184')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COL', N'Colombia', N'CO', N'170')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'COM', N'Comoros', N'KM', N'174')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CPV', N'Cabo Verde', N'CV', N'132')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CRI', N'Costa Rica', N'CR', N'188')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CUB', N'Cuba', N'CU', N'192')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CUW', N'Curaçao', N'CW', N'531')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CXR', N'Christmas Island', N'CX', N'162')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CYM', N'Cayman Islands', N'KY', N'136')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CYP', N'Cyprus', N'CY', N'196')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'CZE', N'Czech Republic', N'CZ', N'203')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DEU', N'Germany', N'DE', N'276')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DJI', N'Djibouti', N'DJ', N'262')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DMA', N'Dominica', N'DM', N'212')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DNK', N'Denmark', N'DK', N'208')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DOM', N'Dominican Republic', N'DO', N'214')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'DZA', N'Algeria', N'DZ', N'12 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ECU', N'Ecuador', N'EC', N'218')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'EGY', N'Egypt', N'EG', N'818')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ERI', N'Eritrea', N'ER', N'232')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ESH', N'Western Sahara*', N'EH', N'732')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ESP', N'Spain', N'ES', N'724')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'EST', N'Estonia', N'EE', N'233')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ETH', N'Ethiopia', N'ET', N'231')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FIN', N'Finland', N'FI', N'246')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FJI', N'Fiji', N'FJ', N'242')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FLK', N'Falkland Islands', N'FK', N'238')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FRA', N'France', N'FR', N'250')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FRO', N'Faroe Islands', N'FO', N'234')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'FSM', N'Micronesia (the Federated States of)', N'FM', N'583')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GAB', N'Gabon', N'GA', N'266')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GBR', N'United Kingdom', N'GB', N'826')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GEO', N'Georgia', N'GE', N'268')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GGY', N'Guernsey', N'GG', N'831')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GHA', N'Ghana', N'GH', N'288')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GIB', N'Gibraltar', N'GI', N'292')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GIN', N'Guinea', N'GN', N'324')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GLP', N'Guadeloupe', N'GP', N'312')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GMB', N'Gambia', N'GM', N'270')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GNB', N'Guinea-Bissau', N'GW', N'624')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GNQ', N'Equatorial Guinea', N'GQ', N'226')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRC', N'Greece', N'GR', N'300')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRD', N'Grenada', N'GD', N'308')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GRL', N'Greenland', N'GL', N'304')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GTM', N'Guatemala', N'GT', N'320')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUF', N'French Guiana', N'GF', N'254')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUM', N'Guam', N'GU', N'316')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GUY', N'Guyana', N'GY', N'328')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'GZA', N'Gaza Strip', N'GZ', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HKG', N'Hong Kong', N'HK', N'344')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HMD', N'Heard Island and McDonald Islands', N'HM', N'334')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HND', N'Honduras', N'HN', N'340')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HRV', N'Croatia', N'HR', N'191')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HTI', N'Haiti', N'HT', N'332')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'HUN', N'Hungary', N'HU', N'348')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IDN', N'Indonesia', N'ID', N'360')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IMN', N'Isle of Man', N'IM', N'833')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IND', N'India', N'IN', N'356')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IOT', N'British Indian Ocean Territory', N'IO', N'86 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRL', N'Ireland', N'IE', N'372')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRN', N'Iran (the Islamic Republic of)', N'IR', N'364')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'IRQ', N'Iraq', N'IQ', N'368')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ISL', N'Iceland', N'IS', N'352')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ISR', N'Israel', N'IL', N'376')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ITA', N'Italy', N'IT', N'380')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JAM', N'Jamaica', N'JM', N'388')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JEY', N'Jersey', N'JE', N'832')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JOR', N'Jordan', N'JO', N'400')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'JPN', N'Japan', N'JP', N'392')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KAZ', N'Kazakhstan', N'KZ', N'398')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KEN', N'Kenya', N'KE', N'404')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KGZ', N'Kyrgyzstan', N'KG', N'417')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KHM', N'Cambodia', N'KH', N'116')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KIR', N'Kiribati', N'KI', N'296')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KNA', N'Saint Kitts and Nevis', N'KN', N'659')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KOR', N'Korea (the Republic of)', N'KR', N'410')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'KWT', N'Kuwait', N'KW', N'414')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LAO', N'Lao People''s Democratic Republic (the)', N'LA', N'418')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBN', N'Lebanon', N'LB', N'422')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBR', N'Liberia', N'LR', N'430')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LBY', N'Libya', N'LY', N'434')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LCA', N'Saint Lucia', N'LC', N'662')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LIE', N'Liechtenstein', N'LI', N'438')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LKA', N'Sri Lanka', N'LK', N'144')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LSO', N'Lesotho', N'LS', N'426')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LTU', N'Lithuania', N'LT', N'440')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LUX', N'Luxembourg', N'LU', N'442')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'LVA', N'Latvia', N'LV', N'428')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAC', N'Macao', N'MO', N'446')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAF', N'Saint Martin (French part)', N'MF', N'663')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MAR', N'Morocco', N'MA', N'504')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MCO', N'Monaco', N'MC', N'492')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDA', N'Moldova (the Republic of)', N'MD', N'498')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDG', N'Madagascar', N'MG', N'450')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MDV', N'Maldives', N'MV', N'462')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MEX', N'Mexico', N'MX', N'484')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MHL', N'Marshall Islands', N'MH', N'584')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MKD', N'Macedonia (the former Yugoslav Republic of)', N'MK', N'807')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MLI', N'Mali', N'ML', N'466')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MLT', N'Malta', N'MT', N'470')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MMR', N'Myanmar', N'MM', N'104')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNE', N'Montenegro', N'ME', N'499')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNG', N'Mongolia', N'MN', N'496')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MNP', N'Northern Mariana Islands', N'MP', N'580')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MOZ', N'Mozambique', N'MZ', N'508')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MRT', N'Mauritania', N'MR', N'478')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MSR', N'Montserrat', N'MS', N'500')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MTQ', N'Martinique', N'MQ', N'474')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MUS', N'Mauritius', N'MU', N'480')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MWI', N'Malawi', N'MW', N'454')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MYS', N'Malaysia', N'MY', N'458')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'MYT', N'Mayotte', N'YT', N'175')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NAM', N'Namibia', N'NA', N'516')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NCL', N'New Caledonia', N'NC', N'540')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NER', N'Niger', N'NE', N'562')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NFK', N'Norfolk Island', N'NF', N'574')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NGA', N'Nigeria', N'NG', N'566')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NIC', N'Nicaragua', N'NI', N'558')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NIU', N'Niue', N'NU', N'570')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NLD', N'Netherlands', N'NL', N'528')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NOR', N'Norway', N'NO', N'578')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NPL', N'Nepal', N'NP', N'524')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NRU', N'Nauru', N'NR', N'520')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'NZL', N'New Zealand', N'NZ', N'554')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'OMN', N'Oman', N'OM', N'512')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PAK', N'Pakistan', N'PK', N'586')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PAN', N'Panama', N'PA', N'591')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PCN', N'Pitcairn', N'PN', N'612')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PER', N'Peru', N'PE', N'604')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PHL', N'Philippines', N'PH', N'608')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PLW', N'Palau', N'PW', N'585')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PNG', N'Papua New Guinea', N'PG', N'598')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'POL', N'Poland', N'PL', N'616')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRI', N'Puerto Rico', N'PR', N'630')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRK', N'Korea (the Democratic People''s Republic of)', N'KP', N'408')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRT', N'Portugal', N'PT', N'620')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PRY', N'Paraguay', N'PY', N'600')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PSE', N'Palestine, State Of', N'PS', N'275')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'PYF', N'French Polynesia', N'PF', N'258')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'QAT', N'Qatar', N'QA', N'634')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'REU', N'Réunion', N'RE', N'638')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ROU', N'Romania', N'RO', N'642')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'RUS', N'Russian Federation', N'RU', N'643')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'RWA', N'Rwanda', N'RW', N'646')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SAU', N'Saudi Arabia', N'SA', N'682')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SDN', N'Sudan', N'SD', N'729')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SEN', N'Senegal', N'SN', N'686')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SGP', N'Singapore', N'SG', N'702')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SGS', N'South Georgia and the South Sandwich Islands', N'GS', N'239')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SHN', N'Saint Helena Ascension And Tristan Da Cunha', N'SH', N'654')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SJM', N'Svalbard and Jan Mayen', N'SJ', N'744')
GO
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLB', N'Solomon Islands', N'SB', N'90 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLE', N'Sierra Leone', N'SL', N'694')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SLV', N'El Salvador', N'SV', N'222')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SMR', N'San Marino', N'SM', N'674')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SOM', N'Somalia', N'SO', N'706')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SPM', N'Saint Pierre and Miquelon', N'PM', N'666')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SRB', N'Serbia', N'RS', N'688')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SSD', N'South Sudan ', N'SS', N'728')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'STP', N'Sao Tome and Principe', N'ST', N'678')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SUR', N'Suriname', N'SR', N'740')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SVK', N'Slovakia', N'SK', N'703')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SVN', N'Slovenia', N'SI', N'705')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SWE', N'Sweden', N'SE', N'752')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SWZ', N'Swaziland', N'SZ', N'748')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SXM', N'Sint Maarten (Dutch part)', N'SX', N'534')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SYC', N'Seychelles', N'SC', N'690')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'SYR', N'Syrian Arab Republic', N'SY', N'760')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TCA', N'Turks and Caicos Islands', N'TC', N'796')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TCD', N'Chad', N'TD', N'148')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TGO', N'Togo', N'TG', N'768')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'THA', N'Thailand', N'TH', N'764')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TJK', N'Tajikistan', N'TJ', N'762')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TKL', N'Tokelau', N'TK', N'772')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TKM', N'Turkmenistan', N'TM', N'795')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TLS', N'Timor-Leste', N'TL', N'626')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TON', N'Tonga', N'TO', N'776')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TTO', N'Trinidad and Tobago', N'TT', N'780')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUN', N'Tunisia', N'TN', N'788')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUR', N'Turkey', N'TR', N'792')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TUV', N'Tuvalu', N'TV', N'798')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TWN', N'Taiwan (Province of China)', N'TW', N'158')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'TZA', N'Tanzania, United Republic Of', N'TZ', N'834')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UGA', N'Uganda', N'UG', N'800')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UKR', N'Ukraine', N'UA', N'804')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UMI', N'United States Minor Outlying Islands', N'UM', N'581')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'URY', N'Uruguay', N'UY', N'858')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'USA', N'United States', N'US', N'840')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'UZB', N'Uzbekistan', N'UZ', N'860')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VAT', N'Holy See', N'VA', N'336')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VCT', N'Saint Vincent and the Grenadines', N'VC', N'670')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VEN', N'Venezuela, Bolivarian Republic Of', N'VE', N'862')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VGB', N'Virgin Islands (British)', N'VG', N'92 ')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VIR', N'Virgin Islands (U.S.)', N'VI', N'850')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VNM', N'Viet Nam', N'VN', N'704')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'VUT', N'Vanuatu', N'VU', N'548')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'WLF', N'Wallis and Futuna', N'WF', N'876')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'WSM', N'Samoa', N'WS', N'882')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'YEM', N'Yemen', N'YE', N'887')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'YUG', N'Yugoslavia', N'YI', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZAF', N'South Africa', N'ZA', N'710')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZMB', N'Zambia', N'ZM', N'894')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZWB', N'Zambia', N'ZA', N'NULL')
INSERT [dbo].[tblCountry] ([Code], [Name], [InternetCode], [NumericCode]) VALUES (N'ZWE', N'Zimbabwe', N'ZW', N'716')
GO
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (1, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (2, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (3, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (4, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (5, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (6, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (7, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (8, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (9, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (10, 4)
INSERT [dbo].[tblEmpClientMeeting] ([MeetingId], [EmpId]) VALUES (12, 4)
GO
SET IDENTITY_INSERT [dbo].[tblEmpDeclined] ON 

INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, CAST(N'2022-04-19T00:00:00.000' AS DateTime), 11, 8, 2, N'test', CAST(N'2022-04-12' AS Date), N'hkh', 1, CAST(N'2022-04-13T11:31:12.427' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, CAST(N'2022-04-21T00:00:00.000' AS DateTime), 11, 8, 2, N'test', CAST(N'2022-12-04' AS Date), N'hkhuyuuy', 0, CAST(N'2022-04-13T11:32:08.683' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, CAST(N'2022-04-20T00:00:00.000' AS DateTime), 11, 4, 1, N'test', CAST(N'2022-04-04' AS Date), N'Test', 1, CAST(N'2022-04-13T12:21:20.757' AS DateTime), 1)
INSERT [dbo].[tblEmpDeclined] ([DeclinedId], [ReportedDate], [UserId], [EmpId], [CaseType], [Reason], [StartDate], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, CAST(N'2022-04-21T12:16:58.000' AS DateTime), 11, 4, 1, N'test', CAST(N'2022-03-16' AS Date), N'Test', 1, CAST(N'2022-04-13T12:30:20.383' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmpDeclined] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpDeclinedCase] ON 

INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (1, CAST(N'2022-03-11' AS Date), 1, 1, N'test', CAST(N'2022-03-08' AS Date), 1, 2, N'trrtrt', CAST(N'2022-03-29T05:05:37.403' AS DateTime), 0, 4)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (2, CAST(N'2022-03-29' AS Date), 1, 1, N'no', CAST(N'2022-03-08' AS Date), 3, 4, N'hfgffgg', CAST(N'2022-04-03T12:46:42.973' AS DateTime), 0, 4)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (3, CAST(N'2022-03-02' AS Date), 2, 1, N'test', CAST(N'2022-02-28' AS Date), 1, 3, N'jhhcvhfvkjb35623@', CAST(N'2022-04-08T11:56:52.933' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (4, CAST(N'2022-03-03' AS Date), 5, 1, N'test', CAST(N'2022-04-02' AS Date), 3, 1, N'giuvfvkoguv16462@', CAST(N'2022-04-08T11:57:50.707' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (5, CAST(N'2022-03-03' AS Date), 5, 1, N'test', CAST(N'2022-04-02' AS Date), 3, 1, N'giuvfvkoguv16462@', CAST(N'2022-04-08T11:57:50.883' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (6, CAST(N'2022-03-03' AS Date), 5, 1, N'test', CAST(N'2022-04-02' AS Date), 3, 1, N'giuvfvkoguv16462@', CAST(N'2022-04-08T11:57:51.063' AS DateTime), 0, 10)
INSERT [dbo].[tblEmpDeclinedCase] ([DeclinedCaseId], [ReportedDate], [ClientId], [CaseId], [DeclinedReason], [AssignmentStartDate], [Day], [Week], [Note], [CreatedOn], [CreatedBy], [EmpId]) VALUES (7, CAST(N'2022-03-06' AS Date), 2, 1, N'test', CAST(N'2022-03-30' AS Date), 4, 1, N'fvcfdffgfgfgfg', CAST(N'2022-04-09T08:19:42.040' AS DateTime), 0, 10)
SET IDENTITY_INSERT [dbo].[tblEmpDeclinedCase] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, NULL, 1, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime), 1, N'Asian', N'USA', N'US', N'243001', NULL, N'Test', 1, CAST(N'2022-03-23T13:29:34.847' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, 4, 2, CAST(N'2022-04-20T10:23:42.000' AS DateTime), CAST(N'2022-04-14T10:23:42.000' AS DateTime), 2, N'Delhi', N'USA', N'US', N'243001', NULL, N'9027972157902797215790279721579027972157', 0, CAST(N'2022-04-07T15:58:12.543' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, 7, 1, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime), 1, N'Asian', N'USA', N'US', N'243001', NULL, NULL, 0, CAST(N'2022-04-07T22:37:44.580' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 8, 2, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime), 1, N'Asian', N'USA', N'US', N'243001', NULL, N'Test', 0, CAST(N'2022-04-07T17:22:35.137' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, 9, 2, CAST(N'2021-12-01T11:37:59.000' AS DateTime), CAST(N'2022-01-03T18:30:00.000' AS DateTime), 7, N'new york', N'USA', N'US', N'273207', NULL, N'tfghghgh', 0, CAST(N'2022-04-08T11:41:21.770' AS DateTime), 1)
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, 10, 2, CAST(N'2021-12-01T11:37:59.000' AS DateTime), CAST(N'2022-01-03T18:30:00.000' AS DateTime), 7, N'new york', N'USA', N'US', N'273207', NULL, N'tfghghgh', 0, CAST(N'2022-04-08T11:41:27.773' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpStatus] ON 

INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (1, 4, 1, 0, 4, N'Test', 1, 1, 1, 0, 1, N'2022-03-16T05:34:13.000Z', N'2022-03-08T05:34:13.000Z', CAST(N'2022-03-29T05:34:33.220' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (2, 4, 1, 0, 4, N'Test', 1, 1, 0, 0, 0, N'2022-03-15T06:53:39.000Z', N'2022-03-15T06:53:39.000Z', CAST(N'2022-03-29T06:55:56.273' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (3, 4, 1, 0, 4, N'test', 1, 1, 0, 0, 0, N'2022-03-16T13:35:42.000Z', N'2022-03-19T13:35:42.000Z', CAST(N'2022-03-29T13:40:00.853' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (4, 4, 6, 0, 4, N'zxczx', 1, 0, 0, 0, 0, N'2022-03-24T15:28:31.000Z', N'2022-03-26T15:28:31.000Z', CAST(N'2022-03-29T15:29:21.530' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (5, 10, 5, 0, 10, N'gjyfytdhcg', 1, 1, 0, 0, 0, N'2022-04-01T08:19:43.000Z', N'2022-04-07T08:19:43.000Z', CAST(N'2022-04-09T08:24:39.473' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (6, 10, 5, 0, 10, N'gjyfytdhcg', 1, 1, 0, 0, 0, N'2022-04-01T08:19:43.000Z', N'2022-04-07T08:19:43.000Z', CAST(N'2022-04-09T08:24:39.843' AS DateTime), 0)
INSERT [dbo].[tblEmpStatus] ([StatusId], [EmployeeId], [TypeId], [ScheduleId], [OfficeUserId], [Note], [OKResume], [ReHire], [TextCheck], [ScreenCheck], [EmailCheck], [EffectiveDate], [ReturnDate], [CreatedOn], [CreatedBy]) VALUES (7, 10, 5, 0, 10, N'gjyfytdhcg', 1, 1, 0, 0, 0, N'2022-04-01T08:19:43.000Z', N'2022-04-07T08:19:43.000Z', CAST(N'2022-04-09T08:24:39.857' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblEmpStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpType] ON 

INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'Applicant HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'HHA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'HHA, PCA', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, N'Nurses Aide', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, N'RN', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
INSERT [dbo].[tblEmpType] ([TypeId], [TypeName], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, N'OfFiceUser', 1, CAST(N'2022-03-23T10:44:51.260' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblEmpType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFolderMaster] ON 

INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (4, 4, N'test nav', CAST(N'2022-04-05T21:44:57.823' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (5, 4, N'', CAST(N'2022-04-08T04:38:37.077' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (6, 4, N'', CAST(N'2022-04-08T04:38:37.097' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (7, 4, N'', CAST(N'2022-04-08T04:39:03.877' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (8, 4, N'', CAST(N'2022-04-08T04:39:04.010' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (9, 4, N'', CAST(N'2022-04-08T04:39:04.053' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (10, 10, N'ecs1', CAST(N'2022-04-08T11:55:04.773' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (11, 10, N'ecs1', CAST(N'2022-04-08T11:55:04.850' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (12, 10, N'ecs1', CAST(N'2022-04-08T11:55:08.393' AS DateTime), 1)
INSERT [dbo].[tblFolderMaster] ([FolderId], [EmpId], [FolderName], [CreatedOn], [CreateBy]) VALUES (13, 10, N'ecs1', CAST(N'2022-04-08T11:55:10.413' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblFolderMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIncident] ON 

INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (1, 4, N'Mar 16 2022  5:04AM', 1, N'rttrt', CAST(N'2022-03-29T05:05:46.590' AS DateTime), 0)
INSERT [dbo].[tblIncident] ([IncidentId], [EmpId], [IncidentDate], [ClientId], [IncidentDetail], [CreatedOn], [CreatedBy]) VALUES (2, 10, N'Mar  3 2022  6:30PM', 3, N'uchtdcgfyc416', CAST(N'2022-04-08T11:53:05.500' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblIncident] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (1, 1, CAST(N'2022-03-28T15:54:53.660' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (2, 1, CAST(N'2022-03-28T16:06:39.623' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (3, 1, CAST(N'2022-03-28T16:21:43.603' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (4, 1, CAST(N'2022-03-29T02:31:08.473' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (5, 1, CAST(N'2022-03-29T02:31:35.607' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (6, 1, CAST(N'2022-03-29T02:35:46.167' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (7, 1, CAST(N'2022-03-29T02:42:36.703' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (8, 1, CAST(N'2022-03-29T04:39:48.867' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (9, 1, CAST(N'2022-03-29T04:40:47.270' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (10, 1, CAST(N'2022-03-29T04:41:41.297' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (11, 1, CAST(N'2022-03-29T05:17:10.377' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (12, 1, CAST(N'2022-03-29T05:38:38.353' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (13, 1, CAST(N'2022-03-29T05:41:07.167' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (14, 1, CAST(N'2022-03-29T06:01:10.030' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (15, 1, CAST(N'2022-03-29T06:46:16.753' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (16, 1, CAST(N'2022-03-29T06:55:00.277' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (17, 1, CAST(N'2022-03-29T07:11:52.040' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (18, 1, CAST(N'2022-03-29T08:41:27.153' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (19, 1, CAST(N'2022-03-29T08:42:46.103' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (20, 1, CAST(N'2022-03-29T08:44:37.640' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (21, 1, CAST(N'2022-03-29T08:46:14.033' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (22, 1, CAST(N'2022-03-29T08:46:30.697' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (23, 1, CAST(N'2022-03-29T09:52:42.810' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (24, 1, CAST(N'2022-03-29T09:53:24.090' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (25, 1, CAST(N'2022-03-29T09:56:10.300' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (26, 1, CAST(N'2022-03-29T09:59:14.900' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (27, 1, CAST(N'2022-03-29T10:12:04.300' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (28, 1, CAST(N'2022-03-29T11:46:04.953' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (29, 1, CAST(N'2022-03-29T12:20:25.503' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (30, 1, CAST(N'2022-03-29T12:30:38.967' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (31, 1, CAST(N'2022-03-29T12:39:23.943' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (32, 1, CAST(N'2022-03-29T12:39:29.207' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (33, 1, CAST(N'2022-03-29T18:45:23.767' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (34, 1, CAST(N'2022-03-29T13:23:30.607' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (35, 1, CAST(N'2022-03-29T13:29:04.493' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (36, 1, CAST(N'2022-03-29T13:29:56.107' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (37, 1, CAST(N'2022-03-29T19:35:59.123' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (38, 1, CAST(N'2022-03-29T19:40:42.207' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (39, 1, CAST(N'2022-03-29T19:47:55.913' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (40, 1, CAST(N'2022-03-29T19:53:49.343' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (41, 1, CAST(N'2022-03-29T19:55:41.443' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (42, 1, CAST(N'2022-03-29T19:57:12.470' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (43, 1, CAST(N'2022-03-29T15:16:50.860' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (44, 1, CAST(N'2022-03-29T15:28:40.363' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (45, 1, CAST(N'2022-03-29T15:29:43.617' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (46, 1, CAST(N'2022-03-29T17:32:39.543' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (47, 1, CAST(N'2022-03-29T22:44:37.393' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (48, 1, CAST(N'2022-03-30T10:47:48.913' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (49, 1, CAST(N'2022-03-30T12:31:35.333' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (50, 1, CAST(N'2022-03-30T14:14:44.483' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (51, 1, CAST(N'2022-03-31T11:41:04.343' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (52, 1, CAST(N'2022-03-31T17:11:27.537' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (53, 1, CAST(N'2022-03-31T17:17:47.957' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (54, 1, CAST(N'2022-03-31T18:06:09.303' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (55, 1, CAST(N'2022-03-31T13:23:18.823' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (56, 1, CAST(N'2022-03-31T13:24:55.277' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (57, 1, CAST(N'2022-03-31T13:57:21.427' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (58, 1, CAST(N'2022-03-31T14:14:11.457' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (59, 1, CAST(N'2022-03-31T14:47:08.137' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (60, 1, CAST(N'2022-03-31T15:36:50.533' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (61, 1, CAST(N'2022-03-31T16:35:08.707' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (62, 1, CAST(N'2022-04-02T02:09:25.687' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (63, 1, CAST(N'2022-04-02T14:42:24.080' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (64, 1, CAST(N'2022-04-02T15:01:20.050' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (65, 1, CAST(N'2022-04-02T15:09:31.537' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (66, 1, CAST(N'2022-04-02T15:26:57.277' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (67, 1, CAST(N'2022-04-02T15:31:26.080' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (68, 1, CAST(N'2022-04-02T10:23:14.303' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (69, 1, CAST(N'2022-04-03T03:51:43.957' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (70, 1, CAST(N'2022-04-03T05:25:06.377' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (71, 1, CAST(N'2022-04-03T05:27:50.163' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (72, 1, CAST(N'2022-04-03T05:28:20.953' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (73, 1, CAST(N'2022-04-03T05:37:33.350' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (74, 1, CAST(N'2022-04-03T05:40:59.297' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (75, 1, CAST(N'2022-04-03T05:41:18.150' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (76, 1, CAST(N'2022-04-03T05:46:07.647' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (77, 1, CAST(N'2022-04-03T05:46:24.570' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (78, 1, CAST(N'2022-04-03T05:52:59.357' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (79, 1, CAST(N'2022-04-03T05:57:15.600' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (80, 1, CAST(N'2022-04-03T11:53:46.110' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (81, 1, CAST(N'2022-04-03T11:58:29.057' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (82, 1, CAST(N'2022-04-03T11:58:29.727' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (83, 1, CAST(N'2022-04-03T12:05:54.420' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (84, 1, CAST(N'2022-04-03T12:09:15.463' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (85, 1, CAST(N'2022-04-03T12:21:40.603' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (86, 1, CAST(N'2022-04-03T13:26:13.790' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (87, 1, CAST(N'2022-04-03T13:53:20.443' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (88, 1, CAST(N'2022-04-03T15:04:39.187' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (89, 1, CAST(N'2022-04-03T12:43:58.400' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (90, 1, CAST(N'2022-04-03T19:10:04.817' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (91, 1, CAST(N'2022-04-03T19:14:47.887' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (92, 1, CAST(N'2022-04-03T19:23:28.737' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (93, 1, CAST(N'2022-04-03T16:16:21.687' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (94, 1, CAST(N'2022-04-04T05:41:28.743' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (95, 1, CAST(N'2022-04-04T11:29:31.587' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (96, 1, CAST(N'2022-04-04T13:04:35.470' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (97, 1, CAST(N'2022-04-04T13:04:36.497' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (98, 1, CAST(N'2022-04-04T13:15:08.690' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (99, 1, CAST(N'2022-04-04T09:55:56.907' AS DateTime), NULL)
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (100, 1, CAST(N'2022-04-04T16:51:26.093' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (101, 1, CAST(N'2022-04-04T17:02:54.977' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (102, 1, CAST(N'2022-04-04T12:11:22.303' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (103, 1, CAST(N'2022-04-04T16:13:21.550' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (104, 1, CAST(N'2022-04-04T16:30:39.960' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (105, 1, CAST(N'2022-04-04T17:10:53.403' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (106, 1, CAST(N'2022-04-04T17:35:08.083' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (107, 1, CAST(N'2022-04-05T15:34:20.917' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (108, 1, CAST(N'2022-04-05T21:35:14.803' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (109, 1, CAST(N'2022-04-05T21:46:47.897' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (110, 1, CAST(N'2022-04-05T23:21:31.623' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (111, 1, CAST(N'2022-04-05T23:23:33.420' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (112, 1, CAST(N'2022-04-05T23:25:06.273' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (113, 1, CAST(N'2022-04-06T05:04:13.650' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (114, 1, CAST(N'2022-04-06T05:35:05.903' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (115, 1, CAST(N'2022-04-06T05:51:51.070' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (116, 1, CAST(N'2022-04-06T12:35:16.187' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (117, 1, CAST(N'2022-04-06T11:23:45.127' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (118, 1, CAST(N'2022-04-06T18:09:41.623' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (119, 1, CAST(N'2022-04-06T13:50:16.033' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (120, 1, CAST(N'2022-04-06T22:18:27.010' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (121, 1, CAST(N'2022-04-06T22:33:06.030' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (122, 1, CAST(N'2022-04-06T23:22:35.433' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (123, 1, CAST(N'2022-04-06T23:26:17.217' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (124, 1, CAST(N'2022-04-07T09:20:45.900' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (125, 1, CAST(N'2022-04-07T09:20:46.860' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (126, 1, CAST(N'2022-04-07T09:48:21.967' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (127, 1, CAST(N'2022-04-07T09:53:40.273' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (128, 1, CAST(N'2022-04-07T10:02:00.520' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (129, 1, CAST(N'2022-04-07T10:15:08.893' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (130, 1, CAST(N'2022-04-07T10:24:02.227' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (131, 1, CAST(N'2022-04-07T10:27:13.673' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (132, 1, CAST(N'2022-04-07T10:29:57.073' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (133, 1, CAST(N'2022-04-07T10:31:54.560' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (134, 1, CAST(N'2022-04-07T11:11:59.677' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (135, 1, CAST(N'2022-04-07T06:36:12.650' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (136, 1, CAST(N'2022-04-07T13:26:19.720' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (137, 1, CAST(N'2022-04-07T13:27:25.367' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (138, 1, CAST(N'2022-04-07T08:32:58.200' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (139, 1, CAST(N'2022-04-07T09:02:53.750' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (140, 1, CAST(N'2022-04-07T09:13:23.673' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (141, 1, CAST(N'2022-04-07T09:32:20.543' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (142, 1, CAST(N'2022-04-07T09:32:20.750' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (143, 1, CAST(N'2022-04-07T15:55:07.083' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (144, 1, CAST(N'2022-04-07T15:55:07.847' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (145, 1, CAST(N'2022-04-07T17:31:45.440' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (146, 1, CAST(N'2022-04-07T14:58:50.387' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (147, 1, CAST(N'2022-04-07T15:06:22.443' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (148, 1, CAST(N'2022-04-07T16:11:10.780' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (149, 1, CAST(N'2022-04-07T16:39:12.593' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (150, 1, CAST(N'2022-04-07T16:50:49.370' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (151, 1, CAST(N'2022-04-07T17:21:23.553' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (152, 1, CAST(N'2022-04-07T17:21:58.130' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (153, 1, CAST(N'2022-04-07T17:33:40.693' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (154, 1, CAST(N'2022-04-08T03:57:09.840' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (155, 1, CAST(N'2022-04-08T14:04:32.970' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (156, 1, CAST(N'2022-04-08T14:04:44.910' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (157, 1, CAST(N'2022-04-08T15:08:20.117' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (158, 1, CAST(N'2022-04-08T15:46:45.893' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (159, 1, CAST(N'2022-04-08T16:18:54.120' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (160, 1, CAST(N'2022-04-08T10:57:41.347' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (161, 1, CAST(N'2022-04-08T11:38:20.780' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (162, 1, CAST(N'2022-04-08T11:55:20.073' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (163, 1, CAST(N'2022-04-08T11:59:05.890' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (164, 1, CAST(N'2022-04-09T08:16:01.500' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (165, 1, CAST(N'2022-04-09T17:15:58.117' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (166, 1, CAST(N'2022-04-10T08:17:09.783' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (167, 1, CAST(N'2022-04-10T12:19:26.083' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (168, 1, CAST(N'2022-04-10T12:36:39.213' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (169, 1, CAST(N'2022-04-10T13:36:55.880' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (170, 1, CAST(N'2022-04-10T14:39:09.453' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (171, 1, CAST(N'2022-04-11T01:30:28.637' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (172, 1, CAST(N'2022-04-11T07:48:38.110' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (173, 1, CAST(N'2022-04-11T13:56:48.827' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (174, 1, CAST(N'2022-04-11T14:05:51.680' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (175, 1, CAST(N'2022-04-11T14:15:39.093' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (176, 1, CAST(N'2022-04-11T14:15:39.397' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (177, 1, CAST(N'2022-04-11T10:49:18.247' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (178, 1, CAST(N'2022-04-11T19:22:28.060' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (179, 1, CAST(N'2022-04-11T21:28:33.573' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (180, 1, CAST(N'2022-04-11T22:08:41.873' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (181, 1, CAST(N'2022-04-11T22:12:35.547' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (182, 1, CAST(N'2022-04-11T22:17:22.323' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (183, 1, CAST(N'2022-04-11T22:19:17.853' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (184, 1, CAST(N'2022-04-11T22:21:11.893' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (185, 1, CAST(N'2022-04-11T22:27:46.843' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (186, 1, CAST(N'2022-04-11T22:34:57.660' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (187, 1, CAST(N'2022-04-11T22:38:39.190' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (188, 1, CAST(N'2022-04-11T22:45:02.410' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (189, 1, CAST(N'2022-04-11T22:46:07.213' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (190, 1, CAST(N'2022-04-11T22:55:51.423' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (191, 1, CAST(N'2022-04-11T23:02:49.533' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (192, 1, CAST(N'2022-04-11T23:05:22.777' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (193, 1, CAST(N'2022-04-12T10:00:01.190' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (194, 1, CAST(N'2022-04-12T04:57:25.120' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (195, 1, CAST(N'2022-04-12T05:02:18.567' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (196, 1, CAST(N'2022-04-12T05:08:07.803' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (197, 1, CAST(N'2022-04-12T06:52:29.667' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (198, 1, CAST(N'2022-04-12T07:10:52.360' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (199, 1, CAST(N'2022-04-12T12:46:24.100' AS DateTime), NULL)
GO
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (200, 1, CAST(N'2022-04-12T07:52:04.143' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (201, 1, CAST(N'2022-04-12T07:58:29.887' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (202, 1, CAST(N'2022-04-12T13:47:14.410' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (203, 1, CAST(N'2022-04-12T14:00:37.147' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (204, 1, CAST(N'2022-04-12T14:02:32.240' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (205, 1, CAST(N'2022-04-12T14:08:57.447' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (206, 1, CAST(N'2022-04-12T08:45:06.190' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (207, 1, CAST(N'2022-04-12T14:34:25.660' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (208, 1, CAST(N'2022-04-12T09:11:07.553' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (209, 1, CAST(N'2022-04-12T14:43:04.597' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (210, 1, CAST(N'2022-04-12T10:20:33.443' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (211, 1, CAST(N'2022-04-12T10:41:55.237' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (212, 1, CAST(N'2022-04-12T11:22:45.063' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (213, 1, CAST(N'2022-04-12T11:59:00.610' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (214, 1, CAST(N'2022-04-12T12:09:40.700' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (215, 1, CAST(N'2022-04-12T14:07:17.747' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (216, 1, CAST(N'2022-04-12T14:10:38.503' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (217, 1, CAST(N'2022-04-12T14:38:21.197' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (218, 1, CAST(N'2022-04-12T14:38:55.270' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (219, 1, CAST(N'2022-04-12T14:38:55.270' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (220, 1, CAST(N'2022-04-12T21:53:47.743' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (221, 1, CAST(N'2022-04-12T22:02:00.727' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (222, 1, CAST(N'2022-04-12T22:04:48.893' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (223, 1, CAST(N'2022-04-12T22:06:39.087' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (224, 1, CAST(N'2022-04-12T22:08:02.563' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (225, 1, CAST(N'2022-04-12T22:10:07.867' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (226, 1, CAST(N'2022-04-12T22:11:47.457' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (227, 1, CAST(N'2022-04-12T16:53:14.150' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (228, 1, CAST(N'2022-04-12T22:35:01.320' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (229, 1, CAST(N'2022-04-13T01:03:47.940' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (230, 1, CAST(N'2022-04-13T07:38:35.910' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (231, 1, CAST(N'2022-04-13T08:07:08.357' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (232, 1, CAST(N'2022-04-13T08:09:55.187' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (233, 1, CAST(N'2022-04-13T11:04:02.830' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (234, 1, CAST(N'2022-04-13T11:04:03.820' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (235, 1, CAST(N'2022-04-13T11:51:38.070' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (236, 1, CAST(N'2022-04-13T07:24:44.333' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (237, 1, CAST(N'2022-04-13T08:48:01.417' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (238, 1, CAST(N'2022-04-13T09:26:47.473' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (239, 1, CAST(N'2022-04-13T09:26:47.483' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (240, 1, CAST(N'2022-04-13T09:26:47.483' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (241, 1, CAST(N'2022-04-13T09:26:47.537' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (242, 1, CAST(N'2022-04-13T09:26:47.653' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (243, 1, CAST(N'2022-04-13T09:33:28.690' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (244, 1, CAST(N'2022-04-13T09:36:56.550' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (245, 1, CAST(N'2022-04-13T09:44:03.887' AS DateTime), NULL)
INSERT [dbo].[tblLogin] ([LoginId], [UserId], [LogIn], [LogOut]) VALUES (246, 1, CAST(N'2022-04-13T10:53:21.440' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaster] ON 

INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (1, 1, 1, N'Active', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (2, 1, 2, N'Deferred', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (3, 1, 3, N'Pending', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (4, 1, 4, N'Inactive', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (5, 2, 1, N'Single', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (6, 2, 2, N'Married', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (7, 2, 3, N'Widow', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (8, 3, 1, N'Male', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (9, 3, 2, N'Female', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (10, 3, 3, N'Other', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (11, 4, 1, N'White', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (12, 4, 2, N'Hispanic', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (13, 4, 3, N'Asian', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (14, 4, 4, N'Black', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (15, 4, 5, N'Native American', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (16, 4, 6, N'Pacific Islander', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (17, 4, 7, N'Other', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (18, 4, 8, N'I do not wish to disclose', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (19, 5, 1, N'Start-Stand By', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (20, 5, 2, N'Start-Start', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (21, 5, 3, N'Restart-Reactivate', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (22, 5, 4, N'Restart-Rehire', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (23, 5, 5, N'Leave-Disability', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (24, 5, 6, N'Leave-FML', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (25, 5, 7, N'Leave-Personal', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (26, 5, 8, N'Leave-Vacation', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (27, 5, 9, N'Leave-Workers Comp', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (28, 6, 1, N'Admission', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (29, 6, 2, N'Start of Care', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (30, 6, 3, N'Hold', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (31, 6, 4, N'Change', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (32, 6, 5, N'Resume', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (33, 6, 6, N'Re-Admission', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (34, 6, 7, N'Pending', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (35, 6, 8, N'Deferred', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (36, 6, 9, N'Discharge', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (37, 6, 10, N'Hospital', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (38, 6, 11, N'Tour Scheduled', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (39, 6, 12, N'Assessment Scheduled', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (40, 6, 13, N'Declined', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (41, 6, 14, N'Withdrawn', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (42, 6, 15, N'First Contacted', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (43, 6, 16, N'First Billed', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (44, 6, 15, N'Teach and Train', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (45, 7, 1, N'CASA/DSS/HRA', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (46, 7, 2, N'CDPAP', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (47, 7, 3, N'CHHA', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (48, 7, 4, N'Death', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (49, 7, 5, N'Hospital', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (50, 7, 6, N'Long Term HHCP', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (51, 7, 7, N'Other Comm. Agency', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (52, 7, 8, N'Other Institution', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (53, 7, 9, N'PCA', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (54, 7, 10, N'Physician', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (55, 7, 11, N'Residential Care Facility', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (56, 7, 12, N'Self/Family/Friend', 1)
INSERT [dbo].[tblMaster] ([MasterId], [MasterType], [ItemId], [ItemName], [IsActive]) VALUES (57, 7, 13, N'Veteran Administration', 1)
SET IDENTITY_INSERT [dbo].[tblMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMasterType] ON 

INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (1, N'EmployeeStatus')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (2, N'MaritalStatus')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (3, N'Gender')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (4, N'Ethnicity')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (5, N'EmpStatusType')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (6, N'ClientStatusActivity')
INSERT [dbo].[tblMasterType] ([MasterITyped], [MasterName]) VALUES (7, N'ClientStatusReferralCode')
SET IDENTITY_INSERT [dbo].[tblMasterType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMedication] ON 

INSERT [dbo].[tblMedication] ([MedicationId], [UserId], [StartDate], [EndDate], [Medication], [NDC], [Strength], [Dosage], [Frequency], [Route], [Tabs], [Prescriber], [Classification], [Instructions], [IsReminders], [IsInstructionscheck], [Isadministrationcheck], [Isselfadministercheck], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 11, CAST(N'2022-04-03T00:00:00.000' AS DateTime), CAST(N'2022-04-28T00:00:00.000' AS DateTime), N'dfsdf', N'sdfds', N'sdfsd', N'sdfsdf', 34, N'sdfg', N'dsfds', N'dfgdf', N'fdgdf', N'1', 1, 1, 1, 1, 0, CAST(N'2022-04-12T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblMedication] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMeeting] ON 

INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (1, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'15:51:00' AS Time), CAST(N'18:56:00' AS Time), 1, CAST(N'2022-03-26T16:03:50.947' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (2, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'09:09:00' AS Time), CAST(N'11:19:00' AS Time), 1, CAST(N'2022-03-27T11:10:31.897' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (3, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'08:10:00' AS Time), CAST(N'10:10:00' AS Time), 1, CAST(N'2022-03-27T11:12:57.953' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (4, 1, CAST(N'2022-03-27T00:00:00.000' AS DateTime), CAST(N'10:15:00' AS Time), CAST(N'11:25:00' AS Time), 1, CAST(N'2022-03-27T11:29:10.650' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (5, 1, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'11:30:00' AS Time), CAST(N'12:30:00' AS Time), 1, CAST(N'2022-03-27T11:31:08.587' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (6, 1, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'21:47:00' AS Time), CAST(N'22:52:00' AS Time), 2, CAST(N'2022-03-28T21:48:16.520' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (7, 1, CAST(N'2022-04-04T00:00:00.000' AS DateTime), CAST(N'13:05:00' AS Time), CAST(N'16:20:00' AS Time), 1, CAST(N'2022-04-04T13:05:43.090' AS DateTime), 0)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (8, 1, CAST(N'2022-03-30T00:00:00.000' AS DateTime), CAST(N'13:08:00' AS Time), CAST(N'14:13:00' AS Time), 1, CAST(N'2022-04-04T13:09:05.607' AS DateTime), 0)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (9, 1, CAST(N'2022-03-30T00:00:00.000' AS DateTime), CAST(N'13:10:00' AS Time), CAST(N'16:10:00' AS Time), 0, CAST(N'2022-04-04T13:11:12.673' AS DateTime), 0)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (10, 1, CAST(N'2022-03-31T00:00:00.000' AS DateTime), CAST(N'13:15:00' AS Time), CAST(N'16:40:00' AS Time), 1, CAST(N'2022-04-04T13:15:32.933' AS DateTime), 0)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (11, 1, CAST(N'2022-04-05T07:27:04.863' AS DateTime), CAST(N'15:51:00' AS Time), CAST(N'18:51:00' AS Time), 1, CAST(N'2022-04-05T07:27:04.863' AS DateTime), 1)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (12, 1, CAST(N'2022-04-08T00:00:00.000' AS DateTime), CAST(N'16:56:00' AS Time), CAST(N'19:56:00' AS Time), 1, CAST(N'2022-04-06T11:26:37.680' AS DateTime), 0)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (13, -1, CAST(N'2022-03-29T00:00:00.000' AS DateTime), CAST(N'17:27:00' AS Time), CAST(N'23:52:00' AS Time), 1, CAST(N'2022-04-08T11:58:20.357' AS DateTime), 0)
INSERT [dbo].[tblMeeting] ([MeetingId], [ClientId], [MeetingDate], [StartTime], [EndTime], [IsStatus], [CreatedOn], [CreatedBy]) VALUES (14, -1, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'21:17:00' AS Time), CAST(N'23:37:00' AS Time), 1, CAST(N'2022-04-12T14:48:28.427' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblMeeting] OFF
GO
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (11, 1, 1, CAST(N'2022-04-05T07:27:04.867' AS DateTime), NULL)
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (12, 1, 0, CAST(N'2022-04-06T11:26:37.690' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (13, 1, 0, CAST(N'2022-04-08T11:58:20.360' AS DateTime), N'Record Inserted')
INSERT [dbo].[tblMeetingLog] ([MeetingId], [Status], [ChangeBy], [ChangeOn], [Text]) VALUES (14, 1, 0, CAST(N'2022-04-12T14:48:28.447' AS DateTime), N'Record Inserted')
GO
SET IDENTITY_INSERT [dbo].[tblMeetingPoint] ON 

INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (1, 6, N'testtt', CAST(N'2022-04-04T12:17:14.080' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (2, 6, N'testtt454', CAST(N'2022-04-04T12:17:44.003' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (3, 6, N'test', CAST(N'2022-04-04T12:53:32.353' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (4, 6, N'gerttt', CAST(N'2022-04-04T12:56:39.037' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (5, 10, N'testing', CAST(N'2022-04-04T13:15:32.933' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (7, 6, N'gfhgghggh', CAST(N'2022-04-04T13:53:11.390' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (8, 8, N'testttssss', CAST(N'2022-04-04T14:47:23.780' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (9, 8, N'errereer', CAST(N'2022-04-04T14:47:27.760' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (10, 8, N'rerere', CAST(N'2022-04-04T14:47:30.513' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (11, 10, N'Test', CAST(N'2022-04-04T09:56:59.137' AS DateTime), 0)
INSERT [dbo].[tblMeetingPoint] ([PointId], [MeetingId], [MeetingPoint], [CreatedOn], [CreatedBy]) VALUES (12, 12, N'188', CAST(N'2022-04-06T11:26:37.680' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblMeetingPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPayRate] ON 

INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (1, 0, CAST(N'2022-03-15' AS Date), CAST(N'2022-03-14' AS Date), 1, N'', N'Test', CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(N'2022-03-29T06:46:59.423' AS DateTime), 0)
INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (2, 0, CAST(N'2022-03-22' AS Date), CAST(N'2022-03-23' AS Date), 1, N'', N'kk', CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-03-29T06:55:22.637' AS DateTime), 0)
INSERT [dbo].[tblPayRate] ([RateId], [EmpId], [EffectiveDate], [EndDate], [ClientId], [Description], [Notes], [Hourly], [LiveIn], [Visit], [OverHourly], [OverLiveIn], [OverVisit], [IncludedHour], [AdditionalHour], [Mileage], [TravelTime], [Gas], [Extra], [CreatedOn], [CreatedBy]) VALUES (3, 0, CAST(N'2022-03-09' AS Date), CAST(N'2022-03-16' AS Date), 1, N'jrtrdg', N'dhfhgcbfh', CAST(6 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(N'2022-04-03T12:46:01.053' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[tblPayRate] OFF
GO
SET IDENTITY_INSERT [dbo].[tblServiceTask] ON 

INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, 10, 1, 10, N'Test1', 1, CAST(N'2022-04-12T13:05:15.067' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T13:05:15.070' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, 10, 3, 12, N'Test3', 1, CAST(N'2022-04-12T13:05:15.070' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, 10, 1, 10, N'Test1', 0, CAST(N'2022-04-12T14:44:50.913' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T14:44:50.913' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, 10, 3, 12, N'Test3', 0, CAST(N'2022-04-12T14:44:50.913' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 10, 1, 10, N'Test1', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, 10, 3, 12, N'Test3', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (10, 10, 1, 10, N'Test1', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (11, 10, 2, 11, N'Test2', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (12, 10, 3, 12, N'Test3', 0, CAST(N'2022-04-12T14:44:53.120' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (13, 11, 1, 12, N'Test12', 1, CAST(N'2022-04-12T17:00:45.737' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (14, 11, 2, 12, N'Test2', 1, CAST(N'2022-04-12T17:00:45.737' AS DateTime), 1)
INSERT [dbo].[tblServiceTask] ([TaskSrvId], [UserId], [TaskId], [Frequency], [ServiceNote], [IsActive], [CreatedOn], [CreatedBy]) VALUES (15, 11, 3, 25, N'Test35', 1, CAST(N'2022-04-12T17:00:45.737' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblServiceTask] OFF
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Australian Antarctic Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Australian Capital Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Christmas Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Cocos (Keeling) Islands')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Coral Sea Islands')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Heard Island and McDonald Islands')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Jervis Bay Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'New South Wales')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Norfolk Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Northern Territory')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Queensland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'South Australia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Tasmania')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Victoria')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'AUS', N'AU', N'Western Australia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Alabama')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Alaska')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Arizona')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Arkansas')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'California')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Colorado')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Connecticut')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Delaware')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Florida')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Georgia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Hawaii')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Idaho')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Illinois')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Indiana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Iowa')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Kansas')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Kentucky')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Louisiana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Maine')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Maryland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Massachusetts')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Michigan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Minnesota')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Mississippi')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Missouri')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Montana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Nebraska')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Nevada')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Hampshire')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Jersey')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New Mexico')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'New York')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'North Carolina')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'North Dakota')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Ohio')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Oklahoma')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Oregon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Pennsylvania')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Rhode Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'South Carolina')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'South Dakota')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Tennessee')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Texas')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Utah')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Vermont')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Virginia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Washington')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'West Virginia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Wisconsin')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'US', N'Wyoming')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Auckland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'New Plymouth')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Wellington')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Nelson')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Marlborough')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Westland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Canterbury')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Otago')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'NZL', N'NZ', N'Southland')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Carlow')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Cavan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Clare')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Cork')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Donegal')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Dublin')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Galway')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kerry')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kildare')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Kilkenny')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Laois')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Leitrim')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Limerick')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Longford')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Louth')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Mayo')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Meath')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Monaghan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Offaly')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Roscommon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Sligo')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Tipperary NR')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Tipperary SR')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Waterford')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Westmeath')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Wexford')
GO
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'IRL', N'IE', N'Wicklow')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'Us', N'Columbia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'USA', N'Us', N'District of Columbia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Alberta')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'British Columbia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Manitoba')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'New Brunswick')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Newfoundland and Labrador')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Nova Scotia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Ontario')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Prince Edward Island')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Quebec')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'CAN', N'CA', N'Saskatchewan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'PRT', N'PT', N'Lisbon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Seoul')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Chungcheong')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Chungcheong')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Gangwon')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Gyeonggi')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Gyeongsang')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Gyeongsang')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'North Jeolla')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'South Jeolla')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Jeju')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'KOR', N'KR', N'Ulsan')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Angermannia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Bahusia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Blechingia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Dalecarlia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Dalia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Gestricia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Gotlandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Hallandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Helsingia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Herdalia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Jemtia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Lapponia Suecana')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Medelpadia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Nericia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Norbothnia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Olandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Ostrogothia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Scania')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Smolandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Sudermannia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Uplandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Wermlandia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westmannia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westrobothnia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'SWE', N'SE', N'Westrogothia')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'GBR', N'GB', N'Surrey')
INSERT [dbo].[tblStates] ([CountryCode], [InternetCountryCode], [StateName]) VALUES (N'GBR', N'GB', N'Cornwall')
GO
SET IDENTITY_INSERT [dbo].[tblTaskMaster] ON 

INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, N'10', N'Bed Bath', N'0', 1, CAST(N'2022-04-12T10:21:19.097' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, N'12', N'Shower', N'0', 1, CAST(N'2022-04-12T10:22:15.453' AS DateTime), 1)
INSERT [dbo].[tblTaskMaster] ([TaskId], [TaskCode], [TaskName], [TaskDetail], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, N'13', N'Sponge Bath', N'0', 1, CAST(N'2022-04-12T10:23:52.727' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblTaskMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (1, NULL, NULL, N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-03-23T17:32:38.897' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (2, NULL, NULL, N'ashokkumarupbly81@gmail.com', N'TEST0023', N'TEST0023', N'Rajeev', N'Kumar', N'Patel', CAST(N'2022-04-14T13:06:33.000' AS DateTime), N'ashokkumarupbly81@gmail.com', NULL, NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-06T18:37:47.283' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (3, NULL, NULL, N'ashokkumarupbly81@gmail.com', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', N'Rakesh', CAST(N'2022-04-06T13:09:23.000' AS DateTime), N'ashokkumarupbly81@gmail.com', NULL, NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-06T18:40:07.697' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (4, NULL, NULL, NULL, NULL, N'Rawat', N'Mayank', N'Kumar', N'Rawat', CAST(N'2022-04-06T10:23:42.000' AS DateTime), N'rakesh.gangwar@ardanuy.com', NULL, NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-07T15:58:12.543' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (5, NULL, NULL, N'rakesh@gmail.com', N'TEST10023', N'TEST10023', N'Rakesh4555', N'kumar', N'Gangwar', CAST(N'2022-04-11T16:43:11.000' AS DateTime), N'rakesh@gmail.com', NULL, NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-07T16:44:39.473' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (6, NULL, NULL, N'rakesh@gmail.com', N'TEST10023', N'TEST10023', N'Rakesh4555455', N'kumar', N'Gangwar', CAST(N'2022-04-11T16:43:11.000' AS DateTime), N'rakesh@gmail.com', NULL, NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-07T16:45:02.720' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, NULL, NULL, NULL, NULL, N'TEST10023', N'Rakesh', N'kumar', N'Gangwar', CAST(N'1921-12-31T18:30:00.000' AS DateTime), N'rakesh@gmail.com', NULL, NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-07T22:37:44.580' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (8, NULL, NULL, NULL, NULL, N'TEST100244', N'Rajeev', N'kumar', N'Gangwar', CAST(N'1921-12-31T18:30:00.000' AS DateTime), N'rakesh@gmail.com', NULL, NULL, NULL, N'9027972157', N'1', 1, NULL, NULL, 1, CAST(N'2022-04-07T17:22:35.137' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (9, NULL, 0, NULL, NULL, N'test', N'bhashkar', NULL, N'pandey', CAST(N'2015-02-01T11:37:59.000' AS DateTime), N'bhashkar12@gmail.com', N'8726945902', N'9999999999', N'9595959595', N'78787878787', N'1', 1, 0, 7, 1, CAST(N'2022-04-08T11:41:21.770' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (10, NULL, 0, NULL, NULL, N'test', N'bhashkar', NULL, N'pandey', CAST(N'2015-02-01T11:37:59.000' AS DateTime), N'bhashkar12@gmail.com', N'8726945902', N'9999999999', N'9595959595', N'78787878787', N'1', 1, 0, 7, 1, CAST(N'2022-04-08T11:41:27.773' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [UserKey], [UserType], [UserName], [UserPassword], [SSN], [FirstName], [MiddleName], [LastName], [DOB], [Email], [CellPhone], [HomePhone], [EmgPhone], [EmgContact], [Gender], [MaritalStatus], [Ethnicity], [SupervisorId], [IsActive], [CreatedOn], [CreatedBy]) VALUES (11, NULL, 0, N'sachinpandey123@gmail.com', N'test23', N'test23', N'sachin', NULL, N'pandey', CAST(N'2017-02-01T14:38:33.000' AS DateTime), N'sachinpandey123@gmail.com', NULL, NULL, NULL, N'7894561233', N'3', 2, 3, 10, 1, CAST(N'2022-04-12T15:13:39.840' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblMaster] ADD  CONSTRAINT [DF_tblMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_IsReminders]  DEFAULT ((0)) FOR [IsReminders]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_IsInstructionscheck]  DEFAULT ((0)) FOR [IsInstructionscheck]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_Isadministrationcheck]  DEFAULT ((0)) FOR [Isadministrationcheck]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_Isselfadministercheck]  DEFAULT ((0)) FOR [Isselfadministercheck]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMedication] ADD  CONSTRAINT [DF_tblMedication_CreatedBy]  DEFAULT ((1)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[tblMeeting] ADD  CONSTRAINT [DF_tblMeeting_IsStatus]  DEFAULT ((1)) FOR [IsStatus]
GO
ALTER TABLE [dbo].[tblContact]  WITH CHECK ADD  CONSTRAINT [FK_tblContact_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblContact] CHECK CONSTRAINT [FK_tblContact_tblUser]
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
ALTER TABLE [dbo].[tblMedication]  WITH CHECK ADD  CONSTRAINT [FK_tblClientMedication_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblMedication] CHECK CONSTRAINT [FK_tblClientMedication_tblUser]
GO
ALTER TABLE [dbo].[tblMeetingPoint]  WITH CHECK ADD  CONSTRAINT [FK_tblMeetingPoint_tblMeeting] FOREIGN KEY([MeetingId])
REFERENCES [dbo].[tblMeeting] ([MeetingId])
GO
ALTER TABLE [dbo].[tblMeetingPoint] CHECK CONSTRAINT [FK_tblMeetingPoint_tblMeeting]
GO
ALTER TABLE [dbo].[tblProvider]  WITH CHECK ADD  CONSTRAINT [FK_tblProvider_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblProvider] CHECK CONSTRAINT [FK_tblProvider_tblUser]
GO
ALTER TABLE [dbo].[tblServiceTask]  WITH CHECK ADD  CONSTRAINT [FK_tblServiceTask_tblTaskMaster] FOREIGN KEY([TaskId])
REFERENCES [dbo].[tblTaskMaster] ([TaskId])
GO
ALTER TABLE [dbo].[tblServiceTask] CHECK CONSTRAINT [FK_tblServiceTask_tblTaskMaster]
GO
ALTER TABLE [dbo].[tblServiceTask]  WITH CHECK ADD  CONSTRAINT [FK_tblServiceTask_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblServiceTask] CHECK CONSTRAINT [FK_tblServiceTask_tblUser]
GO
/****** Object:  StoredProcedure [dbo].[EmpProc]    Script Date: 13-04-2022 18:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpProc]

(
@flag INT=NULL,
@UserId INT=NULL,
@IsActive tinyint=NULL

)
AS

BEGIN

if @flag=1
BEGIN


Select x.UserId as EmpId,x.UserKey as EmpKey,(ISNULL(x.FirstName,'') + ' ' +   ISNULL(x.MiddleName,'') + ' ' + ISNULL(x.LastName,'') ) EmpName,p.TypeId,p.TypeName as EmpType, 
x.CellPhone,x.SSN,y.TaxState,x.IsActive,
(Case When x.Email IS NOT NULL Then 1 ELSE 0 END) HasEmail,  
(Case When x.DOB IS NOT NULL Then 1 ELSE 0 END) HasDOB,z.UserId as ManagerId,
(ISNULL(z.FirstName,'') + ' ' +   ISNULL(z.MiddleName,'') + ' ' + ISNULL(z.LastName,'') ) Coordinator
From tblUser x inner join tblEmployee y on x.UserId=y.UserId
 left join tblUser z on x.SupervisorId=y.UserId
 left join tblEmpType p on y.EmpType=p.TypeId where x.IsActive=@IsActive;

END


if @flag=2
BEGIN
BEGIN TRANSACTION;
Update tblUser SET IsActive = @IsActive Where UserId = @UserId
Update tblEmployee SET IsActive = @IsActive Where UserId = @UserId
COMMIT;
END


END
GO
/****** Object:  StoredProcedure [dbo].[SP_DocumentProc]    Script Date: 13-04-2022 18:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE   PROCEDURE [dbo].[SP_DocumentProc]  
(  
@DocumentId bigint,@FolderId bigint,@EmpId bigint
)  
AS  
BEGIN  
   
   BEGIN TRANSACTION;  
  
BEGIN TRY  
   if(@DocumentId<>0)
   begin
         delete from dbo.tblEmpDocument where DocumentId=@DocumentId
   end
   else if(@FolderId<>0)
   begin
    delete from dbo.tblEmpDocument where FolderId=@FolderId  
	delete from dbo.tblFolderMaster where FolderId=@FolderId and EmpId=@EmpId
   End 
   select x.FolderId,x.FolderName,y.Documentid,y.FileName,y.FilePath,y.Title,y.Description
,y.SeachTag, y.createdon as CreatedOn,e.FirstName + ' ' + e.MiddleName + ' ' + e.LastName as CreatedByName from 
 tblFoldermaster x left join tblEmpDocument y on x.FolderId = y.FolderId left join tblEmployee e on y.CreateOn=e.EmpId where x.EmpId = @EmpId 
END TRY 


BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
  
    IF @@TRANCOUNT > 0  
        ROLLBACK TRANSACTION;  
END CATCH;  
  
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  


   
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDeclinedCaseProc]    Script Date: 13-04-2022 18:11:35 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetPayRateProc]    Script Date: 13-04-2022 18:11:35 ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_SaveClientMedication]    Script Date: 13-04-2022 18:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_SaveClientMedication]  
  
(  
@flag int,  
@UserId int=NULL,
@StartDate datetime=NULL,
@EndDate datetime=NULL,
@Medication varchar(100)=NULL,
@NDC varchar(100)=NULL,
@Strength varchar(100)=NULL,
@Dosage varchar(100)=NULL,
@Frequency tinyint=NULL,
@Route varchar(100)=NULL,
@Tabs varchar(100)=NULL,
@Prescriber varchar(100)=NULL,
@Classification varchar(255)=NULL,
@Instructions varchar(255)=NULL,
@IsReminders bit=NULL,
@IsInstructionscheck bit=NULL,
@Isadministrationcheck bit=NULL,
@Isselfadministercheck bit=NULL,
@IsActive tinyint=NULL,
@CreatedOn datetime=NULL,
@CreatedBy int=NULL,
@MedicationID int
)  
AS  
  
BEGIN  
  
if (@flag=1)  
BEGIN  
  
  
INSERT INTO [dbo].[tblMedication]
(UserId,StartDate,EndDate,Medication,NDC,Strength,Dosage,Frequency,[Route],Tabs,Prescriber,[Classification],Instructions,IsReminders,IsInstructionscheck
,Isadministrationcheck,Isselfadministercheck,IsActive,CreatedOn,CreatedBy)
values(@UserId,@StartDate,@EndDate,@Medication,@NDC,@Strength,@Dosage,@Frequency,@Route,@Tabs,@Prescriber,@Classification,@Instructions,@IsReminders,@IsInstructionscheck
,@Isadministrationcheck,@Isselfadministercheck,@IsActive,@CreatedOn,@CreatedBy)
  
END  

/*************************************************************/


if (@flag=2)  
BEGIN  
  
  
update tblMedication set StartDate=@StartDate,EndDate=@EndDate,Medication=@Medication  
    ,NDC=@NDC,Strength=@Strength,Dosage=@Dosage,  
 Frequency=@Frequency,Route=@Route,Tabs=@Tabs,Prescriber=@Prescriber  
 ,Classification=@Classification,Instructions=@Instructions,  
 IsReminders=@IsReminders,IsInstructionscheck=@IsInstructionscheck,Isadministrationcheck=@Isadministrationcheck  
 ,Isselfadministercheck=@Isselfadministercheck,CreatedOn=@CreatedOn,CreatedBy=@CreatedBy,IsActive=@IsActive where MedicationId=@MedicationID  
  
END  


if (@flag=3)  
BEGIN  
delete tblMedication where MedicationID=@MedicationID 
END  


  
  
select MedicationId,StartDate,EndDate,Medication,NDC,Strength,Dosage,  
 Frequency,Route,Tabs,Prescriber,Classification,Instructions,  
 IsReminders,IsInstructionscheck,Isadministrationcheck,Isselfadministercheck from tblMedication  
 where UserId=@UserId  
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpDeclinedCaseProc]    Script Date: 13-04-2022 18:11:35 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SaveEmpPayRateProc]    Script Date: 13-04-2022 18:11:35 ******/
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
/****** Object:  StoredProcedure [dbo].[UserProc]    Script Date: 13-04-2022 18:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UserProc]

(
@flag INT=null
,@SSN varchar(50)
,@FirstName varchar(50)
,@MiddleName varchar(50)
,@LastName varchar(50)
,@DOB datetime
,@Email varchar(50)
,@Gender varchar(50)
,@MaritalStatus tinyint
,@EmgContact varchar(50)
,@UserName varchar(50)
,@UserPassword varchar(50)
,@IsActive int
,@CreatedOn datetime
,@CreatedBy int
)
AS

BEGIN

IF @flag=1
BEGIN

IF NOT EXISTS (SELECT 0 FROM tblUser 
WHERE Email=@Email)
BEGIN
INSERT INTO tblUser
(SSN,FirstName,MiddleName,LastName,DOB,Email,Gender,MaritalStatus,EmgContact,UserName,UserPassword,IsActive,CreatedOn,CreatedBy)
VALUES (@SSN,@FirstName,@MiddleName,@LastName,@DOB,@Email,@Gender,@MaritalStatus,@EmgContact,@UserName,@UserPassword,@IsActive,@CreatedOn,@CreatedBy)

END




END



END
GO
USE [master]
GO
ALTER DATABASE [ESHomeCareDB.IND] SET  READ_WRITE 
GO
