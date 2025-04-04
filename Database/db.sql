USE [master]
GO

CREATE DATABASE [ReadTopia275]

GO
ALTER DATABASE [ReadTopia275] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReadTopia275].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReadTopia275] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReadTopia275] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReadTopia275] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReadTopia275] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReadTopia275] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReadTopia275] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ReadTopia275] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReadTopia275] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReadTopia275] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReadTopia275] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReadTopia275] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReadTopia275] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReadTopia275] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReadTopia275] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReadTopia275] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ReadTopia275] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReadTopia275] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReadTopia275] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReadTopia275] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReadTopia275] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReadTopia275] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReadTopia275] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReadTopia275] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ReadTopia275] SET  MULTI_USER 
GO
ALTER DATABASE [ReadTopia275] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReadTopia275] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReadTopia275] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReadTopia275] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReadTopia275] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReadTopia275] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ReadTopia275] SET QUERY_STORE = ON
GO
ALTER DATABASE [ReadTopia275] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ReadTopia275]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
	[email] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[birthYear] [int] NOT NULL,
	[descript] [nvarchar](4000) NOT NULL,
	[award] [nvarchar](200) NOT NULL,
	[image] [nvarchar](200) NOT NULL,
	[country] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](70) NOT NULL,
	[authorId] [int] NULL,
	[publisher] [nvarchar](50) NOT NULL,
	[releaseDate] [date] NOT NULL,
	[image] [nvarchar](200) NOT NULL,
	[descript] [nvarchar](4000) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookGenre]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookGenre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookId] [int] NULL,
	[genre] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[comment] [nvarchar](2000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentPost]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[newsId] [int] NULL,
	[username] [nvarchar](30) NULL,
	[reply] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowAuthor]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowAuthor](
	[username] [nvarchar](30) NOT NULL,
	[authorId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[authorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[genre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NULL,
	[content] [nvarchar](4000) NOT NULL,
	[dayCreate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[userID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[rating] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcomment]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcomment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[username] [nvarchar](30) NULL,
	[subcomment] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/19/2023 12:48:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
	[fullname] [nvarchar](60) NULL,
	[gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id], [username], [password], [email]) VALUES (1, N'hieulmhe171617', N'456', N'hieulmhe171617@fpt.edu.vn')
INSERT [dbo].[Admin] ([id], [username], [password], [email]) VALUES (2, N'lehieu', N'123', N'hno3dacnguoi@gmail.com')
INSERT [dbo].[Admin] ([id], [username], [password], [email]) VALUES (3, N'cr7goat', N'123456', N'goatasia@gmail.com')
INSERT [dbo].[Admin] ([id], [username], [password], [email]) VALUES (9, N'admin1', N'123456', N'epbete@yahoo.com')
INSERT [dbo].[Admin] ([id], [username], [password], [email]) VALUES (12, N'admin2', N'123', N'admin22@gmail.com')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (1, N'Chan Ho Kei', 1975, N'Chan Ho-Kei was born and raised in Hong Kong. He has worked as software engineer, scriptwriter, game designer and editor of comic magazines. His writing career started in 2008 at the age of thirty-three, with the short story ‘The Case of Jack and the Beanstalk,’ which was shortlisted for the Mystery Writers of Taiwan Award. He went on to win the award again the following year with ‘The Locked Room of Bluebeard.’', N'2011-Soji Shimada Mystery Award', N'images/Author/ChanHoKei.jpg', N'Hong Kong')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (2, N'Haruki Murakami', 1949, N'Murakami Haruki is a popular contemporary Japanese writer and translator. His work has been described as easily accessible, yet profoundly complex. Many of his novels have themes and titles that invoke classical music, such as the three books making up The Wind-Up Bird Chronicle: The Thieving Magpie (after Rossini opera), Bird as Prophet (after a piano piece by Robert Schumann usually known in English as The Prophet Bird), and The Bird-Catcher (a character in Mozart opera The Magic Flute). Some of his novels take their titles from songs: Dance, Dance, Dance (after The Dells song, although it is widely thought it was titled after the Beach Boys tune), Norwegian Wood (after The Beatles song) and South of the Border, West of the Sun (the first part being the title of a song by Nat King Cole). ', N'2006-World Fantasy Award, Nominate Nobel', N'images/Author/Haruki_Murakami.png', N'Japan')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (3, N'Miguel de Cervantes Saavedra', 1547, N'Miguel de Cervantes y Cortinas, later Saavedra was a Spanish novelist, poet, and playwright. His novel Don Quixote is often considered his magnum opus, as well as the first modern novel.

It is assumed that Miguel de Cervantes was born in Alcalá de Henares. His father was Rodrigo de Cervantes, a surgeon of cordoban descent. Little is known of his mother Leonor de Cortinas, except that she was a native of Arganda del Rey.

In 1569, Cervantes moved to Italy, where he served as a valet to Giulio Acquaviva, a wealthy priest who was elevated to cardinal the next year. By then, Cervantes had enlisted as a soldier in a Spanish Navy infantry regiment and continued his military life until 1575, when he was captured by Algerian corsairs. He was then released on ransom from his captors by his parents and the Trinitarians, a Catholic religious order.', N'DonQuixote - Best fiction in all time', N'images/Author/Miguel.jpg', N'Spain')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (4, N'Antoine de Saint-Exupéry', 1900, N'	People best know French writer and aviator Antoine de Saint-Exupéry for his fairy tale The Little Prince (1943).

He flew for the first time at the age of 12 years in 192 at the Ambérieu airfield and then determined to a pilot. Even after moving to a school in Switzerland and spending summer vacations at the château of the family at Saint-Maurice-de-Rémens in eastern France, he kept that ambition. He writes repeatedly of the house at Saint-Maurice.

Later, in Paris, he failed the entrance exams for the French naval academy and instead enrolled at the prestigious art school Ecole des Beaux-Arts. In 1921, Saint-Exupéry, stationed in Strasbourg, began serving in the military. He learned and forever settled his career path as a pilot. After leaving the service, in 1923, Saint-Exupéry worked in several professions, but in 1926, he went back to flying and signed as a pilot for Aéropostale, a private airline that flew mail from Toulouse, France, to Dakar, Senegal. In 1927, Saint-Exupéry accepted the position of airfield chief for Cape Juby in southern Morocco and began writing his first book, a memoir, called Southern Mail, published in 1929.', N'Grand Prize for Fiction of the French Academy', N'images/Author/Antoine.jpg', N'France')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (5, N'Franz Kafka', 1883, N'Prague-born writer Franz Kafka wrote in German, and his stories, such as " The Metamorphosis " (1916), and posthumously published novels, including The Trial (1925), concern troubled individuals in a nightmarishly impersonal world. Writing of Kafka attracted little attention before his death. During his lifetime, he published only a few short stories and never finished any of his novels except the very short "The Metamorphosis." Kafka wrote to Max Brod, his friend and literary executor: "Dearest Max, my last request: Everything I leave behind me ... in the way of diaries, manuscripts, letters (my own and others"), sketches, and so on, [is] to be burned unread." Brod told Kafka that he intended not to honor these wishes, but Kafka, so knowing, nevertheless consequently gave these directions specifically to Brod, who, so reasoning, overrode these wishes. Brod in fact oversaw the publication of most of work of Kafka in his possession; these works quickly began to attract attention and high critical regard.', N'The Most Influential Authors of the 20th Century', N'https://i.ibb.co/WgYty24/kafka.png', N'Czech Republic')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (6, N'Yuval Noah Harari', 1976, N'Professor Harari was born in Haifa, Israel, to Lebanese parents in 1976. He received his Ph.D. from the University of Oxford in 2002, and is now a lecturer at the Department of History, the Hebrew University of Jerusalem.

He specialized in World History, medieval history and military history. His current research focuses on macro-historical questions: What is the relation between history and biology? What is the essential difference between Homo sapiens and other animals? Is there justice in history? Does history have a direction? Did people become happier as history unfolded?', N'2009 and 2012 - Polonsky Prize for Creativity and Originality', N'images/Author/Harari.png', N'Israel')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (7, N'Trinh Lu', 1948, N'Trinh Lu (1948), real name Trinh Huu Tuan. Used to be an English reporter and editor of the Voice of Vietnam, went to the US to work for nearly 15 years for the United Nations education and communication projects, used to be a painter with many art exhibitions in Vietnam. New York, Trinh Lu is also a minimalist interior designer, an amateur pianist, a writer with short stories that are full of nostalgia and a little bit of meditation...

Talking about Trinh Lu, translator Duong Tuong briefly said "he is a talented person in a family of intellectuals - Hanoi artists have many talented people". Trinh Lu always refers to his father (Mr. Trinh Huu Ngoc) as a great teacher who influences children and grandchildren in the family from lifestyle, career choice and artistic thinking.', N'', N'images/Author/TrinhLu.png', N'Vietnam')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (8, N'Mikhail Sholokhov', 1905, N'Mikhail Aleksandrovich Sholokhov was a famous Soviet writer and was awarded the Nobel Prize for Literature in 1965. Mikhail Sholokhov is best known for his epic novels The Quiet Don.', N'1965 - Nobel Literature', N'images/Author/Mikhail.jfif', N'Russia')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (9, N'Heather Morris', 1953, N'Self-introduce: I am a Native of New Zealand now resident in Australia, working in a large public hospital in Melbourne. For several years I studied and wrote screenplays, one of which was optioned by an academy award winning Screenwriter in the U.S. In 2003, I was introduced to an elderly gentleman "who might just have a story worth telling". The day I met Lale Sokolov changed my life, as our friendship grew and he embarked on a journey of self scrutiny, entrusting the inner most details of his life during the Holocaust. I originally wrote story of Lale as a screenplay - which ranked high in international competitions - before reshaping it into my debut novel, The Tattooist of Auschwitz.', N'2018- Nominee for Best Historical Fiction', N'images/Author/Morris.jpg', N'New Zealand')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (10, N'Higashino Keigo', 1958, N'Keigo Higashino is one of the most popular and biggest selling fiction authors in Japan—as well known as James Patterson, Dean Koontz or Tom Clancy are in the USA.

Born in Osaka, he started writing novels while still working as an engineer at Nippon Denso Co.　(presently DENSO). He won the Edogawa Rampo Prize, which is awarded annually to the finest mystery work, in 1985 for the novel Hōkago (After School) at age 27. Subsequently, he quit his job and started a career as a writer in Tokyo.', N'Naoki Prize', N'images/Author/Keigo.jpeg', N'Japan')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (11, N'Harper Lee', 1926, N'Harper Lee, known as Nelle, was born in the Alabama town of Monroeville, the youngest of four children of Amasa Coleman Lee and Frances Cunningham Finch Lee. Her father, a former newspaper editor and proprietor, was a lawyer who served on the state legislature from 1926 to 1938. As a child, Lee was a tomboy and a precocious reader, and enjoyed the friendship of her schoolmate and neighbor, the young Truman Capote.

After graduating from high school in Monroeville, Lee enrolled at the all-female Huntingdon College in Montgomery (1944-45), and then pursued a law degree at the University of Alabama (1945-50), pledging the Chi Omega sorority. While there, she wrote for several student publications and spent a year as editor of the campus humor magazine, "Ramma-Jamma". Though she did not complete the law degree, she studied for a summer in Oxford, England, before moving to New York in 1950, where she worked as a reservation clerk with Eastern Air Lines and BOAC.

Lee continued as a reservation clerk until the late 50s, when she devoted herself to writing. She lived a frugal life, traveling between her cold-water-only apartment in New York to her family home in Alabama to care for her father.

Having written several long stories, Harper Lee located an agent in November 1956. The following month at the East 50th townhouse of her friends Michael Brown and Joy Williams Brown, she received a gift of a year''s wages with a note: "You have one year off from your job to write whatever you please. Merry Christmas."

Within a year, she had a first draft. Working with J. B. Lippincott & Co. editor Tay Hohoff, she completed To Kill a Mockingbird in the summer of 1959. Published July 11, 1960, the novel was an immediate bestseller and won great critical acclaim, including the Pulitzer Prize for Fiction in 1961. It remains a bestseller with more than 30 million copies in print. In 1999, it was voted "Best Novel of the Century" in a poll by the Library Journal.', N'Pulitzer Prize', N'images/Author/HarperLee.png', N'USA')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (12, N'Fredrik Backman', 1981, N'Fredrik Backman is the #1 New York Times bestselling author of A Man Called Ove (soon to be a major motion picture starring Tom Hanks), My Grandmother Asked Me to Tell You She’s Sorry, Britt-Marie Was Here, Beartown, Us Against You, as well as two novellas, And Every Morning the Way Home Gets Longer and Longer and The Deal of a Lifetime. Things My Son Needs to Know About the World, his first work of non-fiction, will be released in the US in May 2019. His books are published in more than forty countries. He lives in Stockholm, Sweden, with his wife and two children. ', N'Audie Award for Fiction', N'images/Author/Backman.jpg', N'Sweden')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (13, N'Phan Cam Thuong', 1957, N'Phan Cam Thuong (born 1957), is a painter, educator, researcher and art critic in Vietnam. He used to teach at the Faculty of Theory and History of Fine Arts, Vietnam University of Fine Arts (1984 - 2002).', N'', N'images/Author/Thuong.webp', N'Vietnam')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (14, N'Dang Hoang Giang', 1969, N'Dang Hoang Giang is an advocate, a civil society researcher and a governance researcher. He has designed and participated in many innovative projects on local government performance, transparency and accountability. He writes for many newspapers and regularly appears on television to discuss social, judicial and development trends.

As a social activist, Dr. Dang Hoang Giang founded open forums as spaces for civil society activities, dialogue, knowledge dissemination and critical discussions.

Dr. Dang Hoang Giang holds a Master''s degree in Information Technology (Technical University of Ilmenau, Germany) and a PhD in development economics (Vienna University of Technology, Austria).', N'', N'images/Author/HoangGiang.png', N'Vietnam')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (15, N'Ocean Vuong', 1998, N'Ocean Vuong is the author of the debut novel, On Earth We''re Briefly Gorgeous, out from Penguin Press (2019). He is also the author of the critically acclaimed poetry collection, Night Sky with Exit Wounds, a New York Times Top 10 Book of 2016, winner of the T.S. Eliot Prize, the Whiting Award, the Thom Gunn Award, and the Forward Prize for Best First Collection. A Ruth Lilly fellow from the Poetry Foundation, his honors include fellowships from the Lannan Foundation, the Civitella Ranieri Foundation, The Elizabeth George Foundation, The Academy of American Poets, and the Pushcart Prize.

Vuong''s writings have been featured in The Atlantic, Harpers, The Nation, New Republic, The New Yorker, The New York Times, The Village Voice, and American Poetry Review, which awarded him the Stanley Kunitz Prize for Younger Poets. Selected by Foreign Policy magazine as a 2016 100 Leading Global Thinker, alongside Hillary Clinton, Ban Ki-Moon and Justin Trudeau, Ocean was also named by BuzzFeed Books as one of “32 Essential Asian American Writers” and has been profiled on NPR’s “All Things Considered,” PBS NewsHour, Teen Vogue, VICE, The Fantastic Man, and The New Yorker.', N'2019 - Nominee for Best Debut Novel ', N'images/Author/ocean.jpg', N'Vietnam')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (16, N'Italo Calvino', 1923, N'Italo Calvino was born in Cuba and grew up in Italy. He was a journalist and writer of short stories and novels. His best known works include the Our Ancestors trilogy (1952-1959), the Cosmicomics collection of short stories (1965), and the novels Invisible Cities (1972) and If On a Winter''s Night a Traveler (1979).

His style is not easy to classify; much of his writing has an air reminiscent to that of fantastical fairy tales (Our Ancestors, Cosmicomics), although sometimes his writing is more "realistic" and in the scenic mode of observation (Difficult Loves, for example). Some of his writing has been called postmodern, reflecting on literature and the act of reading, while some has been labeled magical realist, others fables, others simply "modern". He wrote: "My working method has more often than not involved the subtraction of weight. I have tried to remove weight, sometimes from people, sometimes from heavenly bodies, sometimes from cities; above all I have tried to remove weight from the structure of stories and from language."', N'Ordre national de la Légion d''honneur', N'images/Author/italo.webp', N'Cuba')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (17, N'Anthony Doerr', 1973, N'Anthony Doerr is the author of six books, The Shell Collector , About Grace , Memory Wall , Four Seasons in Rome , All the Light We Cannot See , and Cloud Cuckoo Land . Doerr is a two-time National Book Award finalist, and his fiction has won five O. Henry Prizes and won a number of prizes including the Pulitzer Prize and the Carnegie Medal. Become a fan on Facebook and stay up-to-date on his latest publications.', N'2014 - Winner for Best Historical Fiction', N'images/Author/doer.webp', N'USA')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (18, N'Khaled Hosseini', 1965, N'Hosseini was born in Kabul, Afghanistan, in 1965. In 1970 Hosseini and his family moved to Iran where his father worked for the Embassy of Afghanistan in Tehran. In 1973 Hosseini''s family returned to Kabul, and Hosseini''s youngest brother was born in July of that year.
In 1976, when Hosseini was 11 years old, Hosseini''s father obtained a job in Paris, France, and moved the family there. They were unable to return to Afghanistan because of the Saur Revolution in which the PDPA communist party seized power through a bloody coup in April 1978. Instead, a year after the Soviet invasion of Afghanistan, in 1980 they sought political asylum in the United States and made their residence in San Jose, California.
Hosseini graduated from Independence High School in San Jose in 1984 and enrolled at Santa Clara University, where he earned a bachelor''s degree in biology in 1988. The following year, he entered the University of California, San Diego, School of Medicine, where he earned his M.D. in 1993. He completed his residency in internal medicine at Cedars-Sinai Medical Center in Los Angeles in 1996. He practiced medicine for over ten years, until a year and a half after the release of The Kite Runner.', N'2004- Exclusive Books Boeke Prize', N'images/Author/khaled.jpg', N'Afghanistan')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (19, N'Jean-Louis Fournier', 1938, N'As a prolific author, Jean-Louis Fournier always knows how to combine humor, culture and sincerity. Between his polytechnic brother and his specialized teacher sister, he chose the path of humor and became a loyal accomplice of Pierre Desproges. He therefore produced episodes of ''La Minute essential de Monsieur Cyclopède'', as well as recordings of his performances at the Grévin theater in 1984 and at the Fontaine theater in 1986. But as a a funny and touching author, the public really found out. With his humorous essays, Jean-Louis Fournier achieved instant success. In ''Applied Arithmetic and Insolence'' (1993), he teaches the reader how to calculate the weight of an idiot''s brain or the amount of caviar that a smicard can buy! In the same vein, his '' French grammar and insolence combine culture and the absurd. Jean-Louis Fournier also devoted two books to his childhood. In 1999, he tackled his father''s alcoholism in "He Never Killed Anyone, My Dad" and won the 2008 Prix Femina for "Daddy Where Are We Going?", a moving recall about his son''s disability.', N'2008 - Prix Femina', N'images/Author/jean.jpg', N'France')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (23, N'Zijin Chen', 1986, N'Zi Jinchen is a Chinese detective story writer. Tu Kim Tran''s good detective stories are always in the "best seller" list, loved and hunted by a detective.', N' ', N'https://i.ibb.co/Lpz49DF/chen.png', N'China')
INSERT [dbo].[Author] ([id], [name], [birthYear], [descript], [award], [image], [country]) VALUES (24, N'Dazai Osamu', 1909, N'Dazai Osamu is a typical Japanese writer of the period that just ended World War II in Japan. Dazai lives and writes the same thing, honest but tragic. He is often mentioned as a prominent member of the Buraiha school of Japanese literature.', N' ', N'https://cdn.shopify.com/s/files/1/0660/3318/9077/files/osamu_dazai_312fbb0b-4793-4cc1-88d7-30fd7ebb709f.jpg?v=1681718190', N'Japan')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (1, N'The Wind-Up Bird Chronicle', 2, N'Knopf', CAST(N'1997-01-01' AS Date), N'images/Book/wind up bird chronicles.png', N'Most of Japan highly regarded novelist now vaults into the first ranks of international fiction writers with this heroically imaginative novel, which is at once a detective story, an account of a disintegrating marriage, and an excavation of the buried secrets of World War II.

In a Tokyo suburb a young man named Toru Okada searches for his wife missing cat. Soon he finds himself looking for his wife as well in a netherworld that lies beneath the placid surface of Tokyo. As these searches intersect, Okada encounters a bizarre group of allies and antagonists: a psychic prostitute; a malevolent yet mediagenic politician; a cheerfully morbid sixteen-year-old-girl; and an aging war veteran who has been permanently changed by the hideous things he witnessed during Japan forgotten campaign in Manchuria.', N'')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (2, N'Dance dance Dance', 2, N'Vintage Books', CAST(N'2002-02-07' AS Date), N'images/Book/dancedancedance.jpg', N'High-class call girls billed to Mastercard. A psychic 13-year-old dropout with a passion for Talking Heads. A hunky matinee idol doomed to play dentists and teachers. A one-armed beach-combing poet, an uptight hotel clerk and one very bemused narrator caught in the web of advanced capitalist mayhem. Combine this offbeat cast of characters with Murakami''s idiosyncratic prose and out comes Dance Dance Dance.', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (3, N'First Person Singular', 2, N'Knopf', CAST(N'2021-04-06' AS Date), N'images/Book/firstperson.jpg', N'The eight masterful stories in this new collection are all told in the first person by a classic Murakami narrator: a lonely man. Some of them (like With the Beatles, Cream and On a Stone Pillow ) are nostalgic looks back at youth. Others are set in adulthood--Charlie Parker Plays Bossa Nova, Carnaval, Confessions of a Shinagawa Monkey and the stunning title story. Occasionally, a narrator who may or may not be Haruki himself is present, as in The Yakult Swallows Poetry Collection. Is it memoir or fiction? The reader decides. The stories all touch beautifully on love and loss, childhood and death . . . all with a signature Murakami twist.''', N'New')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (4, N'Kafka on the Shore', 2, N'Vintage International', CAST(N'2006-01-03' AS Date), N'images/Book/kafkaontheshore.jpg', N'Kafka on the Shore, a tour de force of metaphysical reality, is powered by two remarkable characters: a teenage boy, Kafka Tamura, who runs away from home either to escape a gruesome oedipal prophecy or to search for his long-missing mother and sister; and an aging simpleton called Nakata, who never recovered from a wartime affliction and now is drawn toward Kafka for reasons that, like the most basic activities of daily life, he cannot fathom. Their odyssey, as mysterious to them as it is to us, is enriched throughout by vivid accomplices and mesmerizing events. Cats and people carry on conversations, a ghostlike pimp employs a Hegel-quoting prostitute, a forest harbors soldiers apparently unaged since World War II, and rainstorms of fish (and worse) fall from the sky. There is a brutal murder, with the identity of both victim and perpetrator a riddle—yet this, along with everything else, is eventually answered, just as the entwined destinies of Kafka and Nakata are gradually revealed, with one escaping his fate entirely and the other given a fresh start on his own.', N'')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (5, N'Hear the Wind Sing', 2, N'Kodansha International', CAST(N'1979-06-01' AS Date), N'images/Book/windsing.png', N'Hear the Wind Sing is the first novel by Haruki Murakami; it first appeared in the June 1979 issue of Gunzo, one of the most influential literary magazines in Japan.

There’s not a whole lot to say story wise. A young man drinks a lot of beer and has strange conversations with a mysterious young lady he just met. So, classic Murakami.', N'')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (6, N'A Wild Sheep Chase', 2, N'Vintage', CAST(N'2002-04-09' AS Date), N'images/Book/sheepchase.png', N'Japan in the 80s of the last century, a nameless protagonist, divorced from his wife, a rich but boring job, smart but nothing in life stimulates him to think - The Wild Sheep Hunt is clearly set based on a familiar reality of modern times. An air of indifference and languor follows the reader into a whole world of fantasy, and does not leave even as the story progresses to the most thrilling episodes of the strange wild sheep hunt, or the short passages. melancholy sexy with girl with unusually beautiful ears. Murakami has fictionalized right on the basis of the real world and created a dreamlike novel. Perhaps novels should be read that way: like dreaming a dream so deep, that even though our rational part knows it''s not real, when we wake up and go on with our lives, somewhere in our hearts still lingering incessantly.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (7, N'The Borrowed', 1, N'Spiderline', CAST(N'2017-01-03' AS Date), N'images/Book/1367.jpg', N'Covering six cases that span Kwan Chun-dok’s impressive fifty-year career, The Borrowed takes readers on a tour of Hong Kong history from the Leftist Riot in 1967; the conflict between the HK Police and ICAC (Independent Commission Against Corruption) in 1977; the Tiananmen Square Massacre in 1989; the Handover in 1997; to the present day of 2013, when Kwan is called on to solve his final case, the murder of a local billionaire, while Hong Kong increasingly resembles a police state. Along the way we meet Communist rioters, ultraviolent gangsters, stallholders at the city’s many covered markets, pop singers enmeshed in the high-stakes machinery of star-making, and a people always caught in the shifting balance of political power, whether in London or Beijing.

A gripping and brilliantly constructed novel from a talented new voice in crime fiction, The Borrowed paints a dynamic portrait of Hong Kong and reveals just how closely the past and present are connected in this fascinating city.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (8, N'Second Sister', 1, N'Black Cat', CAST(N'2020-02-18' AS Date), N'images/Book/secondsister.jpg', N'Chan Ho-Kei’s The Borrowed was one of the most acclaimed international crime novels of recent years, a vivid and compelling tale of power, corruption, and the law spanning five decades of the history of Hong Kong. Now he delivers Second Sister, an up-to-the-minute tale of a Darwinian digital city where everyone from tech entrepreneurs to teenagers is struggling for the top.
A schoolgirl—Siu-Man—has committed suicide, leaping from her twenty-second floor window to the pavement below. Siu-Man is an orphan and the librarian older sister who’s been raising her refuses to believe there was no foul play—nothing seemed amiss. She contacts a man known only as N.—a hacker, and an expert in cybersecurity and manipulating human behavior. But can Nga-Yee interest him sufficiently to take her case, and can she afford it if he says yes?

What follows is a cat and mouse game through the city of Hong Kong and its digital underground, especially an online gossip platform, where someone has been slandering Siu-Man. The novel is also populated by a man harassing girls on mass transit; high school kids, with their competing agendas and social dramas; a Hong Kong digital company courting an American venture capitalist; and the Triads, market women and noodle shop proprietors who frequent N.’s neighborhood of Sai Wan. In the end it all comes together to tell us who caused Siu-Man’s death and why, and to ask, in a world where online and offline dialogue has increasingly forgotten about the real people on the other end, what the proper punishment is.', N'New')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (9, N'Balloon Man', 1, N'Nha Nam', CAST(N'2022-10-01' AS Date), N'images/Book/balloon.jpg', N'“Just by touching the skin of the subject, I can enter commands, turning the person into an imaginary balloon shape.”

A guy dissatisfied with his job, determined to become an assassin.
An anomalous ability that allows him to touch any living thing and turn them into "balloons", and can be timed to activate.
A bad luck makes him often fall into funny situations, accompanied by a wrinkled brain to always solve all problems in a spectacular way.
All have created a main character who is both humorous and interesting, while also intrigued and calculated in his every move.

With The Balloon Man, Chan Ho-Kei (Chan Hao Co) has written a mind-boggling play full of laughter, with a strong Hong Kong imprint. Those who are fans of Hong Kong movies will surely read the story while thinking of the movie scenes and prominent issues such as police chasing criminals, clan fights, gang purges, or rising prices.', N'New')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (10, N'Don Quixote', 3, N'Penguin Books', CAST(N'2003-02-25' AS Date), N'images/Book/don-quixote.jpg', N'Don Quixote has become so entranced by reading chivalric romances that he determines to become a knight-errant himself. In the company of his faithful squire, Sancho Panza, his exploits blossom in all sorts of wonderful ways. While Quixote''s fancy often leads him astray—he tilts at windmills, imagining them to be giants—Sancho acquires cunning and a certain sagacity. Sane madman and wise fool, they roam the world together, and together they have haunted readers'' imaginations for nearly four hundred years.

With its experimental form and literary playfulness, Don Quixote has been generally recognized as the first modern novel. The book has been enormously influential on a host of writers, from Fielding and Sterne to Flaubert, Dickens, Melville, and Faulkner, who reread it once a year, "just as some people read the Bible."', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (11, N'And Quiet Flows the Don', 8, N'Dent', CAST(N'1996-01-01' AS Date), N'images/Book/don.jpg', N'And Quiet Flows the Don or Quietly Flows the Don (Тихий Дон, lit. "The Quiet Don") is 4-volume epic novel by Russian writer Mikhail Aleksandrovich Sholokhov. The 1st three volumes were written from 1925 to ''32 & published in the Soviet magazine October in 1928–32. The 4th volume was finished in 1940. The English translation of the 1st three volumes appeared under this title in 1934. The novel is considered one of the most significant works of Russian literature in the 20th century. It depicts the lives & struggles of Don Cossacks during WWI, the Russian Revolution & Russian Civil War. In 1965, Sholokhov was awarded the Nobel Prize for Literature. The authorship of the novel is contested by some literary critics & historians, who believe it wasn''t entirely written by Sholokhov. However, following the discovery of the manuscript, the consensus is that the work is, in fact, Sholokhov’s.', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (12, N'The little Prince', 4, N'Harcourt', CAST(N'2000-06-29' AS Date), N'images/Book/prince.jpeg', N'A pilot stranded in the desert awakes one morning to see, standing before him, the most extraordinary little fellow. "Please," asks the stranger, "draw me a sheep." And the pilot realizes that when life''s events are too difficult to understand, there is no choice but to succumb to their mysteries. He pulls out pencil and paper... And thus begins this wise and enchanting fable that, in teaching the secret of what is really important in life, has changed forever the world for its readers.

Few stories are as widely read and as universally cherished by children and adults alike as The Little Prince, presented here in a stunning new translation with carefully restored artwork. The definitive edition of a worldwide classic, it will capture the hearts of readers of all ages.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (13, N'The Castle', 5, N'Dramatist', CAST(N'2003-06-01' AS Date), N'images/Book/the-castle.jpg', N'Left unfinished by Kafka in 1922 and not published until 1926, two years after his death, The Castle is the haunting tale of K.’s relentless, unavailing struggle with an inscrutable authority in order to gain access to the Castle. Scrupulously following the fluidity and breathlessness of the sparsely punctuated original manuscript, Mark Harman’s new translation reveals levels of comedy, energy, and visual power, previously unknown to English language readers.', N'')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (14, N'The Metamorphosis', 5, N'Bantam Classics', CAST(N'2003-06-01' AS Date), N'images/Book/meta.jpg', N'"As Gregor Samsa awoke one morning from uneasy dreams he found himself transformed in his bed into a gigantic insect. He was laying on his hard, as it were armor-plated, back and when he lifted his head a little he could see his domelike brown belly divided into stiff arched segments on top of which the bed quilt could hardly keep in position and was about to slide off completely. His numerous legs, which were pitifully thin compared to the rest of his bulk, waved helplessly before his eyes."

With it''s startling, bizarre, yet surprisingly funny first opening, Kafka begins his masterpiece, The Metamorphosis. It is the story of a young man who, transformed overnight into a giant beetle-like insect, becomes an object of disgrace to his family, an outsider in his own home, a quintessentially alienated man. A harrowing—though absurdly comic—meditation on human feelings of inadequacy, guilt, and isolation, The Metamorphosis has taken its place as one of the most widely read and influential works of twentieth-century fiction. As W.H. Auden wrote, "Kafka is important to us because his predicament is the predicament of modern man."', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (15, N'Sapiens', 6, N'Vintage', CAST(N'2015-01-01' AS Date), N'images/Book/sapien.jpg', N'One hundred thousand years ago, at least six different species of humans inhabited Earth. Yet today there is only one—homo sapiens. What happened to the others? And what may happen to us?

Most books about the history of humanity pursue either a historical or a biological approach, but Dr. Yuval Noah Harari breaks the mold with this highly original book that begins about 70,000 years ago with the appearance of modern cognition. From examining the role evolving humans have played in the global ecosystem to charting the rise of empires, Sapiens integrates history and science to reconsider accepted narratives, connect past developments with contemporary concerns, and examine specific events within the context of larger ideas.

Dr. Harari also compels us to look ahead, because over the last few decades humans have begun to bend laws of natural selection that have governed life for the past four billion years. We are acquiring the ability to design not only the world around us, but also ourselves. Where is this leading us, and what do we want to become?

Featuring 27 photographs, 6 maps, and 25 illustrations/diagrams, this provocative and insightful work is sure to spark debate and is essential reading for aficionados of Jared Diamond, James Gleick, Matt Ridley, Robert Wright, and Sharon Moalem.', N'New')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (16, N'Anything you draw is a self-portrait', 7, N'NXB My Thuat', CAST(N'2021-12-01' AS Date), N'images/Book/tuhoa.jpg', N'To say this is a book exhibition is probably not enough. To say that this is an anthology, including many old and new paintings during more than six decades of non-stop painting by artist Trinh Lu, is probably still not correct. Like the greeting, the small message at the beginning of this book, written by the author Trinh Lu himself, entering this book, readers feel like they are invited to the house to have tea, to look at the pictures, and then to share some stories around them. paintings, around tea... From picture stories, one can hear both people''s stories, their own stories, and even the love of the world... full of gentleness and depth.', N'New')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (17, N'The Tattooist of Auschwitz', 9, N'Harper', CAST(N'2018-09-04' AS Date), N'images/Book/tattoo.jpg', N'In April 1942, Lale Sokolov, a Slovakian Jew, is forcibly transported to the concentration camps at Auschwitz-Birkenau. When his captors discover that he speaks several languages, he is put to work as a Tätowierer (the German word for tattooist), tasked with permanently marking his fellow prisoners.

Imprisoned for more than two and a half years, Lale witnesses horrific atrocities and barbarism—but also incredible acts of bravery and compassion. Risking his own life, he uses his privileged position to exchange jewels and money from murdered Jews for food to keep his fellow prisoners alive.

One day in July 1942, Lale, prisoner 32407, comforts a trembling young woman waiting in line to have the number 34902 tattooed onto her arm. Her name is Gita, and in that first encounter, Lale vows to somehow survive the camp and marry her.

A vivid, harrowing, and ultimately hopeful re-creation of Lale Sokolov''s experiences as the man who tattooed the arms of thousands of prisoners with what would become one of the most potent symbols of the Holocaust, The Tattooist of Auschwitz is also a testament to the endurance of love and humanity under the darkest possible conditions.', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (18, N'The Miracles of the Namiya', 10, N'Yen On', CAST(N'2019-09-24' AS Date), N'images/Book/namiya.jpg', N'When three delinquents hole up in an abandoned general store after their most recent robbery, to their great surprise, a letter drops through the mail slot in the store''s shutter. This seemingly simple request for advice sets the trio on a journey of discovery as, over the course of a single night, they step into the role of the kindhearted former shopkeeper who devoted his waning years to offering thoughtful counsel to his correspondents. Through the lens of time, they share insight with those seeking guidance, and by morning, none of their lives will ever be the same.

By acclaimed author Keigo Higashino, The Miracles of the Namiya General Store is a work that has touched the hearts of readers around the world.', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (19, N'Journey Under the Midnight Sun', 10, N'Brown', CAST(N'2015-10-08' AS Date), N'images/Book/sun.jpg', N'When a man is found murdered in an abandoned building in Osaka in 1973, unflappable detective Sasagaki is assigned to the case. He begins to piece together the connection of two young people who are inextricably linked to the crime; the dark, taciturn son of the victim and the unexpectedly captivating daughter of the main suspect. Over the next twenty years we follow their lives as Sasagaki pursues the case - which remains unsolved - to the point of obsession.

Stark, intriguing and stylish, Journey Under the Midnight Sun is an epic mystery by the bestselling Japanese author.', N'')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (20, N'Homo Deus', 6, N'Harper', CAST(N'2017-02-21' AS Date), N'images/Book/deus.jpg', N'Yuval Noah Harari, author of the critically-acclaimed New York Times bestseller and international phenomenon Sapiens, returns with an equally original, compelling, and provocative book, turning his focus toward humanity’s future, and our quest to upgrade humans into gods.

Over the past century humankind has managed to do the impossible and rein in famine, plague, and war. This may seem hard to accept, but, as Harari explains in his trademark style—thorough, yet riveting—famine, plague and war have been transformed from incomprehensible and uncontrollable forces of nature into manageable challenges. For the first time ever, more people die from eating too much than from eating too little; more people die from old age than from infectious diseases; and more people commit suicide than are killed by soldiers, terrorists and criminals put together. The average American is a thousand times more likely to die from binging at McDonalds than from being blown up by Al Qaeda.

What then will replace famine, plague, and war at the top of the human agenda? As the self-made gods of planet earth, what destinies will we set ourselves, and which quests will we undertake? Homo Deus explores the projects, dreams and nightmares that will shape the twenty-first century—from overcoming death to creating artificial life. It asks the fundamental questions: Where do we go from here? And how will we protect this fragile world from our own destructive powers? This is the next stage of evolution. This is Homo Deus.

With the same insight and clarity that made Sapiens an international hit and a New York Times bestseller, Harari maps out our future.', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (21, N'A Man Called Ove', 12, N'Atria Books', CAST(N'2014-06-15' AS Date), N'images/Book/ove.jpg', N'A grumpy yet loveable man finds his solitary world turned on its head when a boisterous young family moves in next door.

Meet Ove. He''s a curmudgeon, the kind of man who points at people he dislikes as if they were burglars caught outside his bedroom window. He has staunch principles, strict routines, and a short fuse. People call him the bitter neighbor from hell, but must Ove be bitter just because he doesn''t walk around with a smile plastered to his face all the time?

Behind the cranky exterior there is a story and a sadness. So when one November morning a chatty young couple with two chatty young daughters move in next door and accidentally flatten Ove''s mailbox, it is the lead-in to a comical and heartwarming tale of unkempt cats, unexpected friendship, and the ancient art of backing up a U-Haul. All of which will change one cranky old man and a local residents'' association to their very foundations.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (22, N'To Kill a Mockingbird', 11, N' Harper Perennial', CAST(N'2006-05-23' AS Date), N'images/Book/mockingbird.jpg', N'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it. "To Kill A Mockingbird" became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.

Compassionate, dramatic, and deeply moving, "To Kill A Mockingbird" takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (23, N'Human life customs', 13, N'Nha Nam', CAST(N'2017-11-01' AS Date), N'images/Book/doinguoi.jpg', N'“You are holding in your hand the second book in a series of four books by Phan Cam Thuong, which will be completed in four to five years. A Vietnamese history. But it should be clear: not the history of Vietnam as a country, but the history of Vietnamese people in their daily human life. Phan Cam Thuong did not write about the rising and falling dynasties, the fierce victories and defeats, the political events considered important ... as we often see in the solemn national histories. Here we meet another, smaller, everyday and more intimate (but oddly, less well-known) one: human beings. Vietnamese people. Phan Cam Thuong shows that there is another such history of this country that we do not really know, but equally important, if not more. Yes, maybe even more, because people have to live like this, do these things first, and then they can do the things that are considered great. Only can make History ''big''. Or, after all, those big, great things are, in some ways, likely to be governed by these very things, even to the point of decision. Because it existed before. It is the background. It is more enduring and enduring than dynasties and regimes.”
- Nguyen Ngoc', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (24, N'Good, evil and Smart phone', 14, N'Nha Nam', CAST(N'2017-12-28' AS Date), N'images/Book/thienac.jpg', N'Perhaps we are witnessing an amazing resurgence of public humiliation, when in the age of the Internet never before has people been humiliated so quickly, so much and so easily! The hot news stories in Good, Evil and Smartphone by Dang Hoang Giang have sharply sketched the portrait of the social media era''s humiliation culture, with all its ugliness and destructive power. Together with thorough analysis, we have to face ourselves, and we are startled to realize that sometimes we are also contributing to that common picture...

Not stopping there, the author finds a way out with the power of composure, steadfastness and compassion. To realize that behind the virtual avatars are real people, that every like button can be a whip contributing to the collective execution. To criticize without killing, to condemn but not to insult. In order to respect the law while respecting human dignity. To empathize, tolerate and forgive. To work towards a society of justice, restoration and healing, instead of cruel punishment.

Rich in topicality but with lasting meaning, touching every hidden corner of everyone''s heart but at the same time covering the whole society, the book is constructive and deeply humane.
Put down your smartphone and read this book!!!', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (25, N'Life''s Destination', 14, N'Nha Nam', CAST(N'2018-01-01' AS Date), N'images/Book/cuocdoi.jpg', N'"Destination of Life" recounts an unforgettable journey with near-death people. Embark on "a world of colossal tragedy and loss, of dignity and self-esteem in harsh circumstances, of betrayal and fear, of intense love and unrelenting hope, in a nutshell. on the contrary, of all things human, at its most intense", the author wants to find an answer to the inner urge: how we should behave in the face of death, and what death can teach What do we for life?

Strangely, the fates told in the book, despite being at the highest level of pain, show something so beautiful that it makes us choke: the courage to go through a tragedy that is difficult to express in words. words, the calm attitude of a man free from death, eager to do useful work, arose in his last days. Accompanying them, we feel grateful, happy and rich. Folding the book, we can get a lot: a profound awareness of human finiteness, a calm attitude towards the end, an appreciation of life, from which to begin to move away from vanities. noisy, rearrange priorities, focus on the core things that make life meaningful.

A brave journey. A book full of humanity and soul-moving."', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (26, N'On Earth We''re Briefly Gorgeous', 15, N'Penguin Press', CAST(N'2019-06-04' AS Date), N'images/Book/onearth.jpg', N'On Earth We''re Briefly Gorgeous is a letter from a son to a mother who cannot read. Written when the speaker, Little Dog, is in his late twenties, the letter unearths a family''s history that began before he was born — a history whose epicenter is rooted in Vietnam — and serves as a doorway into parts of his life his mother has never known, all of it leading to an unforgettable revelation. At once a witness to the fraught yet undeniable love between a single mother and her son, it is also a brutally honest exploration of race, class, and masculinity. Asking questions central to our American moment, immersed as we are in addiction, violence, and trauma, but undergirded by compassion and tenderness, On Earth We''re Briefly Gorgeous is as much about the power of telling one''s own story as it is about the obliterating silence of not being heard.

With stunning urgency and grace, Ocean Vuong writes of people caught between disparate worlds, and asks how we heal and rescue one another without forsaking who we are. The question of how to survive, and how to make of it a kind of joy, powers the most important debut novel of many years.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (27, N'If on a Winter''s Night a Traveler', 16, N'Key Porter', CAST(N'1982-10-20' AS Date), N'images/Book/travel.jpg', N'If on a Winter''s Night a Traveler is a marvel of ingenuity, an experimental text that looks longingly back to the great age of narration—"when time no longer seemed stopped and did not yet seem to have exploded." Italo Calvino''s novel is in one sense a comedy in which the two protagonists, the Reader and the Other Reader, ultimately end up married, having almost finished If on a Winter''s Night a Traveler. In another, it is a tragedy, a reflection on the difficulties of writing and the solitary nature of reading. The Reader buys a fashionable new book, which opens with an exhortation: "Relax. Concentrate. Dispel every other thought. Let the world around you fade." Alas, after 30 or so pages, he discovers that his copy is corrupted, and consists of nothing but the first section, over and over. Returning to the bookshop, he discovers the volume, which he thought was by Calvino, is actually by the Polish writer Bazakbal. Given the choice between the two, he goes for the Pole, as does the Other Reader, Ludmilla. But this copy turns out to be by yet another writer, as does the next, and the next.

The real Calvino intersperses 10 different pastiches—stories of menace, spies, mystery, premonition—with explorations of how and why we choose to read, make meanings, and get our bearings or fail to. Meanwhile the Reader and Ludmilla try to reach, and read, each other. If on a Winter''s Night is dazzling, vertiginous, and deeply romantic. "What makes lovemaking and reading resemble each other most is that within both of them times and spaces open, different from measurable time and space."', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (28, N'1Q84', 2, N'Knopf', CAST(N'2011-10-25' AS Date), N'images/Book/1q84.jpg', N'A young woman name Aomame follows a taxi driver’s enigmatic suggestion and begins to notice puzzling discrepancies in the world around her. She has entered, she realizes, a parallel existence, which she calls 1Q84 —“Q is for ‘question mark.’ A world that bears a question.” Meanwhile, an aspiring writer named Tengo takes on a suspect ghostwriting project. He becomes so wrapped up with the work and its unusual author that, soon, his previously placid life begins to come unraveled.

As Aomame’s and Tengo’s narratives converge over the course of this single year, we learn of the profound and tangled connections that bind them ever closer: a beautiful, dyslexic teenage girl with a unique vision; a mysterious religious cult that instigated a shoot-out with the metropolitan police; a reclusive, wealthy dowager who runs a shelter for abused women; a hideously ugly private investigator; a mild-mannered yet ruthlessly efficient bodyguard; and a peculiarly insistent television-fee collector.

A love story, a mystery, a fantasy, a novel of self-discovery, a dystopia to rival George Orwell’s — 1Q84 is Haruki Murakami’s most ambitious undertaking yet: an instant best seller in his native Japan, and a tremendous feat of imagination from one of our most revered contemporary writers.', N'')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (29, N'All the Light We Cannot See', 17, N'Scribner', CAST(N'2014-01-01' AS Date), N'images/Book/light.jpg', N'Marie-Laure lives in Paris near the Museum of Natural History, where her father works. When she is twelve, the Nazis occupy Paris and father and daughter flee to the walled citadel of Saint-Malo, where Marie-Laure’s reclusive great uncle lives in a tall house by the sea. With them they carry what might be the museum’s most valuable and dangerous jewel.

In a mining town in Germany, Werner Pfennig, an orphan, grows up with his younger sister, enchanted by a crude radio they find that brings them news and stories from places they have never seen or imagined. Werner becomes an expert at building and fixing these crucial new instruments and is enlisted to use his talent to track down the resistance. Deftly interweaving the lives of Marie-Laure and Werner, Doerr illuminates the ways, against all odds, people try to be good to one another.

From the highly acclaimed, multiple award-winning Anthony Doerr, the stunningly beautiful instant New York Times bestseller about a blind French girl and a German boy whose paths collide in occupied France as both try to survive the devastation of World War II.', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (30, N'The Trial', 5, N'Vintage', CAST(N'2001-04-09' AS Date), N'images/Book/trial.jpg', N'Written in 1914 but not published until 1925, a year after Kafka’s death, The Trial is the terrifying tale of Josef K., a respectable bank officer who is suddenly and inexplicably arrested and must defend himself against a charge about which he can get no information. Whether read as an existential tale, a parable, or a prophecy of the excesses of modern bureaucracy wedded to the madness of totalitarianism, The Trial has resonated with chilling truth for generations of readers.', N'Recommend')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (32, N'The Kite Runner', 18, N'Riverhead', CAST(N'2004-05-01' AS Date), N'images/Book/kite.jpg', N'1970s Afghanistan: Twelve-year-old Amir is desperate to win the local kite-fighting tournament and his loyal friend Hassan promises to help him. But neither of the boys can foresee what would happen to Hassan that afternoon, an event that is to shatter their lives. After the Russians invade and the family is forced to flee to America, Amir realises that one day he must return to an Afghanistan under Taliban rule to find the one thing that his new world cannot grant him: redemption.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (33, N'The Devotion of Suspect X', 10, N'Minotaur', CAST(N'2011-02-01' AS Date), N'images/Book/x.gif', N'Yasuko lives a quiet life, working in a Tokyo bento shop, a good mother to her only child. But when her ex-husband appears at her door without warning one day, her comfortable world is shattered.

When Detective Kusanagi of the Tokyo Police tries to piece together the events of that day, he finds himself confronted by the most puzzling, mysterious circumstances he has ever investigated. Nothing quite makes sense, and it will take a genius to understand the genius behind this particular crime...', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (34, N'The Elephant Vanishes', 2, N'Vintage', CAST(N'1994-06-28' AS Date), N'images/Book/vanish.jpg', N'With the same deadpan mania and genius for dislocation that he brought to his internationally acclaimed novels A Wild Sheep Chase and Hard-Boiled Wonderland and the End of the World, Haruki Murakami makes this collection of stories a determined assault on the normal. A man sees his favorite elephant vanish into thin air; a newlywed couple suffers attacks of hunger that drive them to hold up a McDonald''s in the middle of the night; and a young woman discovers that she has become irresistible to a little green monster who burrows up through her backyard.

By turns haunting and hilarious, The Elephant Vanishes is further proof of Murakami''s ability to cross the border between separate realities -- and to come back bearing treasure.', N'Popular')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (35, N'The House of the Sleeping Mermaid', 10, N'Mintbooks', CAST(N'2017-05-15' AS Date), N'images/Book/nguoica.jpg', N'The story revolves around a couple who plan to divorce after their daughter Mizuko enters elementary school. But the bad news came suddenly: an unfortunate accident happened to the little girl at the swimming pool. However, the truth is even more painful when their only daughter is brain dead but her heart is still beating by a strange force.

It was at the very moment that the signs of life were dying out, her parents had to accept a devastating truth: should her organs be donated or not?

The girl''s heart was still beating and the legal constraints did not allow any doctor to dare to confirm that she was dead. They are forced to choose whether to continue taking care of their daughter who has fallen into a vegetative state or to let go and accept the organ donation of their only beloved daughter?

All of this created a series of worries for the girl''s parents: "So the person who killed my daughter will be me?" This is not only the couple''s legal concerns, but it also rekindled. The group hopes that as long as her heart is still beating, she will one day gradually regain consciousness. real value in many parts of the world on organ donation.

The book is also like a reminder of family affection, about the hearts of parents for their children. Family is a place where you never stop loving and never give up. Obviously, only love can make people so anxious, want to try their best to save their only daughter. Like a mermaid, little Mizuko has a beautiful heart, weak beats, and still wants to convey to her parents the love that has never been expressed.', N'New')
INSERT [dbo].[Book] ([id], [name], [authorId], [publisher], [releaseDate], [image], [descript], [status]) VALUES (36, N'Où on va, papa ?', 19, N'Le Livre de Poche', CAST(N'2010-03-03' AS Date), N'images/Book/papa.jpg', N'Daddy, I''m going? opened up a world where darkness reigns: the world of disability, pain, torment, disappointment... But the guidance of Jean-Louis Fournier, a master of black satire, makes us When we have to laugh, cry, think, and when we close a book, that''s when we stop being sad. Because he himself, the father who had "two apocalypse days", with this thin but heart-moving book, lit up the basic joy of life, though fragile but never extinguished.

“A little book to get to the point.” Its author wanted to do so when he first faced the pain of his sons'' disability in literature. The simplicity, touching and originality filled there made Dad, where are we going? became a minor masterpiece, winning the Fémina Prize, the focal point of the 2008 French literary book season.', N'Recommend')
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[CommentPost] ON 

INSERT [dbo].[CommentPost] ([id], [newsId], [username], [reply]) VALUES (1, 1, N'aomame', N'Wanna read this book imediatelyyyyy!')
INSERT [dbo].[CommentPost] ([id], [newsId], [username], [reply]) VALUES (2, 1, N'jokerfbt', N'what is your country? I like this cover <3')
INSERT [dbo].[CommentPost] ([id], [newsId], [username], [reply]) VALUES (3, 2, N'jokerfbt', N'wow')
SET IDENTITY_INSERT [dbo].[CommentPost] OFF
GO
INSERT [dbo].[FollowAuthor] ([username], [authorId]) VALUES (N'aomame', 1)
INSERT [dbo].[FollowAuthor] ([username], [authorId]) VALUES (N'jokerfbt', 1)
GO
INSERT [dbo].[Genre] ([genre]) VALUES (N'Autobiography')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Classic')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Cultural')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Detective')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Fiction')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Historical')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Humor')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Kid')
INSERT [dbo].[Genre] ([genre]) VALUES (N'LGBT')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Mystery')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Non-fiction')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Novel')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Politics')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Realism')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Science')
INSERT [dbo].[Genre] ([genre]) VALUES (N'Surrealism')
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [username], [content], [dayCreate]) VALUES (1, N'hoalac', N'<p><span style="font-size:16px"><strong>why&nbsp;<span style="color:#e74c3c">if on a winter&#39;s night a traveler</span>&nbsp; be super classic novel?</strong></span></p>

<p><img alt="" src="https://images2.thanhnien.vn/zoom/700_438/Uploaded/congson/2021_05_29/neumotdemdong_BWNQ.jpg" style="height:282px; width:450px" /></p>

<p><strong><em>&quot;You are about to begin reading Italo Calvino&#39;s new novel, If on a winter&#39;s night a traveller. Relax. Let the world around you fade.&quot;</em><br />
<br />
The opening line of this unusual book really fades the world around you and immerses you in a mystical, eccentric, surreal world where you are energised right from the scratch to encounter the world which refers to its own existence- something which is unprecedented.</strong><br />
<br />
<br />
<br />
<br />
<br />
The book is a genius in a way that how it approaches the story- narrative of the book is in second person -the protagonist is a young male reader known simply as The Reader. There is a second character, a female reader, referred to by the author as the Other Reader. The relationship between the two characters is one of the two plot drivers of the book. Calvino borrows plot and style from authors of each of different genres, inserting them in his novel, making it inter-textual, or based off of many texts. The author has a lot to stay with the ongoing story.</p>
', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[News] ([id], [username], [content], [dayCreate]) VALUES (2, N'jokerfbt', N'<p><span style="color:#f39c12"><span style="font-family:Comic Sans MS,cursive"><span style="font-size:22px">The best paragraph t like in The Wind-Up Bird Chronicle of Murakami</span></span></span></p>

<p>&nbsp;</p>

<p><span style="font-family:Comic Sans MS,cursive"><span style="font-size:14px">Then, suddenly, he thought of the ocean&mdash;the ocean he saw from the deck of the ship that had brought him from Japan to Manchuria eight years ago. Until then he had never seen the ocean, and had not seen it since. He still clearly remembered the salty air. The ocean was one of the most wondrous things he had ever seen in his life - bigger and deeper than anything he had ever imagined. It changes color, shape and shade according to the time, place and weather. It aroused a deep sadness in his heart, and at the same time brought him peace of mind. Will he ever see the sea again? He loosened his grip and dropped the baseball bat to the ground. The stick hit the ground with a dry sound. After the stick left his hand, he felt a little more nauseous.</span></span></p>

<p><span style="font-family:Comic Sans MS,cursive"><span style="font-size:14px">The wind-up bird continued to chirp, but no one else heard it.</span></span></p>

<p style="text-align:center"><span style="font-family:Comic Sans MS,cursive"><span style="font-size:14px"><img alt="" src="https://cdna.artstation.com/p/assets/images/images/045/158/182/large/gurkirat-singh-jan13-1.jpg?1642050147" style="height:300px; width:600px" /></span></span></p>
', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[News] ([id], [username], [content], [dayCreate]) VALUES (3, N'tengo', N'<p>No thing here, i just want test the news<p/>', CAST(N'2022-03-03' AS Date))
INSERT [dbo].[News] ([id], [username], [content], [dayCreate]) VALUES (4, N'hoalac', N'<p>My first book I read is Harper Lee''s book<p/>', CAST(N'2020-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [email], [password], [fullname], [gender]) VALUES (1, N'user1', N'user1@gmail.com', N'123', N'I am User1', 1)
INSERT [dbo].[User] ([id], [username], [email], [password], [fullname], [gender]) VALUES (2, N'aomame', N'aomame1Q84@gmail.com', N'456', N'Tsuki Aomame', 0)
INSERT [dbo].[User] ([id], [username], [email], [password], [fullname], [gender]) VALUES (3, N'tengo', N'tengo3@gmail.com', N'a123', N'Wataya Tengo', 1)
INSERT [dbo].[User] ([id], [username], [email], [password], [fullname], [gender]) VALUES (4, N'canxicacbonat123', N'caco3@gmail.com', N'456', N'Canxi Cacbonat', 0)
INSERT [dbo].[User] ([id], [username], [email], [password], [fullname], [gender]) VALUES (5, N'jokerfbt', N'captianjack5tr@gmail.com', N'123', N'Tuan Cui FBT JOKER 5cu', 0)
INSERT [dbo].[User] ([id], [username], [email], [password], [fullname], [gender]) VALUES (8, N'toru', N'toru@gmail.com', N'123', N'Okada Toru', 1)
INSERT [dbo].[User] ([id], [username], [email], [password], [fullname], [gender]) VALUES (9, N'hoalac', N'hoalac123@gmail.com', N'123', N'Van Quyet QBV', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__F3DBC572ADB98670]    Script Date: 11/19/2023 12:48:58 AM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__F3DBC572F15AE6DD]    Script Date: 11/19/2023 12:48:58 AM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([authorId])
REFERENCES [dbo].[Author] ([id])
GO
ALTER TABLE [dbo].[BookGenre]  WITH CHECK ADD FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[BookGenre]  WITH CHECK ADD FOREIGN KEY([genre])
REFERENCES [dbo].[Genre] ([genre])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[CommentPost]  WITH CHECK ADD FOREIGN KEY([newsId])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[CommentPost]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[FollowAuthor]  WITH CHECK ADD FOREIGN KEY([authorId])
REFERENCES [dbo].[Author] ([id])
GO
ALTER TABLE [dbo].[FollowAuthor]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Subcomment]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Subcomment]  WITH CHECK ADD FOREIGN KEY([userID], [bookID])
REFERENCES [dbo].[Comment] ([id], [bookID])
GO
USE [master]
GO
ALTER DATABASE [ReadTopia275] SET  READ_WRITE 
GO
