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
INSERT [dbo].[tblEmployee] ([EmpId], [UserId], [EmpType], [DateOfHire], [DateOfFirstCase], [Dependents], [City], [Country], [TaxState], [ZipCode], [Municipality], [Notes], [IsActive], [CreatedOn], [CreatedBy]) VALUES (7, 8, 2, CAST(N'2022-03-07T18:30:00.000' AS DateTime), CAST(N'2022-03-15T18:30:00.000' AS DateTime),