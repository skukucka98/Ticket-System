using Online_Ticket_System.Create;
using Online_Ticket_System.Display.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public static class Connection
    {
        private static SqlConnection conn;
        private static SqlCommand cmd;
        private static int count;
        static readonly string PasswordHash = "P@@Sw0rd";
        static readonly string SaltKey = "S@LT&KEY";
        static readonly string VIKey = "@1B2c3D4e5F6g7H8";

        static Connection()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["TicketDBConnectionString"].ToString();
            conn = new SqlConnection(ConnectionString);
            cmd = new SqlCommand("", conn);
        }

        public static string Encrypt(string plainText)
        {
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

            byte[] keyBytes = new Rfc2898DeriveBytes(PasswordHash, Encoding.ASCII.GetBytes(SaltKey)).GetBytes(256 / 8);
            var symmetricKey = new RijndaelManaged() { Mode = CipherMode.CBC, Padding = PaddingMode.Zeros };
            var encryptor = symmetricKey.CreateEncryptor(keyBytes, Encoding.ASCII.GetBytes(VIKey));

            byte[] cipherTextBytes;

            using (var memoryStream = new MemoryStream())
            {
                using (var cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write))
                {
                    cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
                    cryptoStream.FlushFinalBlock();
                    cipherTextBytes = memoryStream.ToArray();
                    cryptoStream.Close();
                }
                memoryStream.Close();
            }
            return Convert.ToBase64String(cipherTextBytes);
        }

        public static string Decrypt(string encryptedText)
        {
            byte[] cipherTextBytes = Convert.FromBase64String(encryptedText);
            byte[] keyBytes = new Rfc2898DeriveBytes(PasswordHash, Encoding.ASCII.GetBytes(SaltKey)).GetBytes(256 / 8);
            var symmetricKey = new RijndaelManaged() { Mode = CipherMode.CBC, Padding = PaddingMode.None };

            var decryptor = symmetricKey.CreateDecryptor(keyBytes, Encoding.ASCII.GetBytes(VIKey));
            var memoryStream = new MemoryStream(cipherTextBytes);
            var cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
            byte[] plainTextBytes = new byte[cipherTextBytes.Length];

            int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
            memoryStream.Close();
            cryptoStream.Close();
            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount).TrimEnd("\0".ToCharArray());
        }

        public static int GetNumofUserByUsernameAndPassword(string usn, string pass)
        {
            string query = string.Format("EXEC LookupNumberofUserby_Username_Password '{0}', '{1}'", usn, Encrypt(pass));
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    count = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
            return count;
        }

        public static ArrayList GetUserbyUsernameandPassword(string usn, string pass)
        {
            ArrayList list = new ArrayList();
            string query = string.Format("EXEC LookupUserby_Username_Password '{0}', '{1}'", usn, Encrypt(pass));
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string Username = reader.GetString(1);
                    string Password = Decrypt(reader.GetString(2));
                    string FirstName = reader.GetString(3);
                    string LastName = reader.GetString(4);
                    string Email = reader.GetString(5);
                    string UserType = reader.GetString(6);
                    string Phone = reader.GetString(7);
                    string Address1 = reader.GetString(8);
                    string Address2 = reader.GetString(9);
                    string City = reader.GetString(10);
                    string State = reader.GetString(11);
                    string Zipcode = reader.GetString(12);

                    Users User = new Users(id, Username, Password, FirstName, LastName, Email, UserType, Phone, Address1, Address2, City, State, Zipcode);
                    list.Add(User);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return list;
        }

        public static int GetNumofUserByUsernameAndEmail(string usn, string email)
        {
            string query = string.Format("EXEC LookupNumberofUserby_Username_Email '{0}', '{1}'", usn, email);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    count = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
            return count;
        }

        public static int GetIDbyUsernameandEmail(string usn, string email)
        {
            string query = string.Format("EXEC LookupPasswordby_Username_Email '{0}', '{1}'", usn, email);
            int ID = 0;
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ID = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return ID;
        }

        public static ArrayList GetCategory()
        {
            ArrayList list = new ArrayList();
            string query = string.Format("EXEC [dbo].[GetCategoryInfo]");
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string cat = reader.GetString(1);
                    string subcat = reader.GetString(2);
                    Category category = new Category(id, cat, subcat);
                    list.Add(category);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }

            return list;
        }

        public static DataTable GetPaymentType()
        {
            string query = string.Format("Select paymenttypeid, Name From tblPaymentType order by 2");
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }

            return dt;
        }

        //public static ArrayList GetPaymentType()
        //{
        //    ArrayList list = new ArrayList();
        //    string query = string.Format("Select paymenttypeid, Name From tblPaymentType order by 2");
        //    try
        //    {
        //        conn.Open();
        //        cmd.CommandText = query;
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            PaymentType pt = new PaymentType();
        //            pt.ID = reader.GetInt32(0);
        //            pt.Name = reader.GetString(1);
        //            list.Add(pt);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        Console.WriteLine(e);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //    return list;
        //}

        public static int CheckUserExist(string uname)
        {
            int NumofUser = 0;
            string query = string.Format("SELECT COUNT(*) FROM tblUser WHERE Username = '{0}'", uname);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    NumofUser = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
            return NumofUser;
        }

        public static void UserRegister(string username, string pass)
        {
            string query = string.Format("DECLARE @Username varchar(150) " +
                                            "DECLARE @Password varchar(150) " +
                                            "SELECT @Username = '{0}', @Password = '{1}' " +
                                            "EXECUTE [dbo].[InsertNewUser] @Username ,@Password", username, Encrypt(pass));
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
        }

        public static int GetUserID(string username)
        {
            int id = 0;
            string query = string.Format("EXECUTE [dbo].[SelectUserID] '{0}'", username);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    id = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
            return id;
        }

        public static int CusRegister(int uid, string fname, string lname, string email, string phone, string add1, string add2, string city, string state, string zip, int guest)
        {
            string query = string.Format("EXECUTE [dbo].[InsertNewCustomer] {0}, '{1}', '{2}', '{3}', '{4}', '{5}','{6}', '{7}', '{8}', '{9}', {10}", uid, fname, lname, phone, email, add1, add2, city, state, zip, guest);
            int result = 0;
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    result = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
            return result;
        }

        internal static ArrayList GetUserbyUserID(string p)
        {
            ArrayList list = new ArrayList();
            string query = string.Format("EXEC LookupUserbyID '{0}'", p);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string Username = reader.GetString(1);
                    string Password = Decrypt(reader.GetString(2));
                    string FirstName = reader.GetString(3);
                    string LastName = reader.GetString(4);
                    string Email = reader.GetString(5);
                    string UserType = reader.GetString(6);
                    string Phone = reader.GetString(7);
                    string Address1 = reader.GetString(8);
                    string Address2 = reader.GetString(9);
                    string City = reader.GetString(10);
                    string State = reader.GetString(11);
                    string Zipcode = reader.GetString(12);
                    Users User = new Users(id, Username, Password, FirstName, LastName, Email, UserType, Phone, Address1, Address2, City, State, Zipcode);
                    list.Add(User);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return list;
        }

        public static void UpdatePassbyUnameEmail(string uname, string upass, string pass)
        {
            string query = string.Format("EXEC [UpdatePasswordby_Username_Email] '{0}', '{1}', '{2}'", uname, Encrypt(pass), Encrypt(upass));
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
        }

        public static void UpdatePassByID(string pass, string id)
        {
            string query = string.Format("EXEC [UpdatePasswordbyID] '{0}', '{1}'", Encrypt(pass), id);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
        }

        public static void UpdateCustomerInfo(string id, string fnm, string lnm, string phone, string email, string add1, string add2, string city, string state, string zip)
        {
            string query = string.Format("EXEC [UpdateCustomerbyID] '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}'", id, fnm, lnm, phone, email, add1, add2, city, state, zip);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
        }

        //Set Slideshow info
        public static ArrayList GetUpcomingEvent()
        {
            ArrayList list = new ArrayList();
            string query = string.Format("EXEC [GetUpcomingEvent]");
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Event e = new Event();
                    e.ID = reader.GetInt32(0);
                    e.Category = reader.GetString(1);
                    e.Subcategory = reader.GetString(2);
                    e.Name = reader.GetString(3);
                    e.Datetime = Convert.ToDateTime(reader.GetString(4));
                    e.Status = reader.GetString(5);
                    e.Desc = reader.GetString(6);
                    e.Picture = reader.GetString(7);
                    e.Venue = reader.GetString(8);
                    e.Totalavailable = reader.GetInt32(9);
                    e.Totalsold = reader.GetInt32(10);
                    e.Minprice = (double)reader.GetDecimal(11);
                    list.Add(e);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return list;

        }

        //GetNumber of Event by searchterm

        public static int GetEbyServal(string ser)
        {
            int id = 0;
            string query = string.Format("EXECUTE [dbo].[GetNumofEventBySerValue] '{0}'", ser);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    id = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
            return id;
        }

        //Set Datatable for dropdown selection

        public static DataTable GetSubCat()
        {
            string query = string.Format("EXEC [GetCategoryInfo]");
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }

            return dt;
        }

        public static DataTable GetSubCategoryBycat(string c)
        {
            DataTable dt = new DataTable();
            string query = string.Format("EXEC [GetSubCategorybycatname] '{0}'", c);
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }

            return dt;
        }
        //Set Datatable for Gridview display
        public static DataTable Upcome_Event()
        {
            string query = string.Format("EXEC [GetUpcomingEvent]");
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        public static DataTable UpcomeByCat(string c)
        {
            string query = string.Format("EXEC [GetUpcomingEventByCat] '{0}'", c);
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        public static DataTable SuggestEvent()
        {
            string query = string.Format("EXEC [GetSuggestEvent]");
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        public static DataTable UpcomeBySubCat(string sc)
        {
            string query = string.Format("EXEC [GetUpcomingEventBysubCat] '{0}'", sc);
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        public static DataTable UpcomeBySerVal(string sc)
        {
            string query = string.Format("EXEC [GetUpcomingEventBySerValue] '{0}'", sc);
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(dt);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        //test password
        public static string pass(string uname, string email)
        {
            string pass = "";
            ArrayList list = new ArrayList();
            string query = string.Format("SELECT password from dbo.tblUser INNER JOIN dbo.tblCustomer ON dbo.tblUser.UserID = dbo.tblCustomer.UserID where username = '{0}' and email = '{1}'", uname, email);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    pass = Decrypt(reader.GetString(0));
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return pass;
        }

        private static int eid;
        public static int AddEvents(Event ticket)
        {
            string query = string.Format("EXEC AddEvent '{0}','{1}', '{2}', {3}, '{4}', {5}, '{6}', '{7}'", ticket.Name, ticket.Date, ticket.Time, ticket.Venue, ticket.Status, ticket.Category, ticket.Desc, ticket.Picture);
            cmd.CommandText = query;

            try
            {
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    eid = reader.GetInt32(0);

                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
                cmd.Parameters.Clear();
            }

            return eid;
        }

        public static ArrayList GetEventDetail(int id)
        {
            ArrayList list = new ArrayList();
            string query = string.Format("EXEC [GetEventDetail] {0}", id);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Event e = new Event();
                    e.ID = reader.GetInt32(0);
                    e.Category = reader.GetString(1);
                    e.Subcategory = reader.GetString(2);
                    e.Name = reader.GetString(3);
                    e.Datetime = Convert.ToDateTime(reader.GetString(4));
                    e.Status = reader.GetString(5);
                    e.Desc = reader.GetString(6);
                    e.Picture = reader.GetString(7);
                    e.Venue = reader.GetString(8);
                    list.Add(e);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return list;

        }

        public static int NumofCat(string cat, string subcat)
        {
            int num = 0;
            string query = string.Format("select count(*) from tbleventcategory c "
                                        + "inner join tbleventcategory pc on c.parentcategoryid = pc.eventcategoryid "
                                        + "where pc.name = '{0}' and c.name = '{1}'", cat, subcat);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    num = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            finally
            {
                conn.Close();
            }
            return num;
        }

        public static int AddSubCat(string cat, string subcat)
        {
            int num = 0;
            string query = string.Format("EXEC AddCategory '{0}', '{1}'", cat, subcat);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    num = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return num;
        }

        private static int id;
        internal static int AddVenue(Venue venue)
        {
            ArrayList slv = new ArrayList();
            string query = string.Format("EXEC [AddVenue] '{0}' ,'{1}', '{2}', '{3}', '{4}', '{5}', '{6}'", venue.Name, venue.Address1, venue.Address2, venue.City, venue.State, venue.Zip, venue.Desc);

     

            try
            {
                conn.Open();
                cmd.CommandText = query;
                // cmd.ExecuteNonQuery();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    id = reader.GetInt32(0);

                }
            }

            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();

            }

            return id;
        }

        internal static void AddSeatSection(Seatlevel SSection)
        {
            string query = string.Format("INSERT into tblVenueInfo( VenueID, Section, SeatTotal) VALUES('{0}','{1}','{2}')", SSection.VID, SSection.Section, SSection.SeatTotal);
            cmd.CommandText = query;


            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
                cmd.Parameters.Clear();
            }
        }
        private static int scid;
        internal static int AddSeatCat(int eventid, string section)
        {
            string query = string.Format("EXEC AddSeatCategory {0}, '{1}'", eventid, section);
            cmd.CommandText = query;
            try
            {
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    scid = reader.GetInt32(0);

                }
            }
            finally
            {
                conn.Close();
                cmd.Parameters.Clear();
            }

            return scid;
        }

        internal static void AddSeat(int endpos, string price, int catid)
        {
            string query = string.Format("EXEC	[dbo].[Get_SeatInfo] 1, {0}, {1}, {2}", endpos, price, catid);
            cmd.CommandText = query;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
                cmd.Parameters.Clear();
            }
        }

        internal static int GetFromVenueInfo(int section, int venue)
        {
            string query = string.Format("Select seattotal from tblvenueinfo where Section ={0} and venueID = {1}", section, venue);
            int stotal = 0;
            try
            {
                conn.Open();
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    stotal = reader.GetInt32(0);

                }
            }

            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();

            }

            return stotal;
        }


        //Get Available Seats in eventdetail
        public static DataSet GetAvlSeat(int id, int qty, string level, string price)
        {
            string query = string.Format("EXECUTE [GetAvailableSeats] {0}, {1}, '{2}', '{3}'", id, qty, level, price);
            DataSet ds = new DataSet();
            try
            {
                conn.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                adpt.Fill(ds);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return ds;
        }

        public static int NumofPtype(string name)
        {
            string query = string.Format("EXEC [LookupExistingPType] '{0}'", name);
            int count = 0;
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    count = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return count;
        }

        public static int CreatePtype(string name)
        {
            string query = string.Format("EXEC [CreateNewPType] '{0}'", name);
            int count = 0;
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    count = reader.GetInt32(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }
            return count;
        }

        public static ArrayList GetCartinfo(int id)
        {
            CartItem ct;
            ArrayList list = new ArrayList();
            string query = string.Format("EXEC [dbo].[CartItemInfo] {0}", id);
            try
            {
                conn.Open();
                cmd.CommandText = query;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ct = new CartItem();
                    ct.EventName = reader.GetString(0);
                    ct.EventDate = reader.GetDateTime(1);
                    ct.eventtime = reader.GetString(2);
                    ct.catenum = reader.GetString(3);
                    ct.seatnum = reader.GetInt32(4);
                    ct.Price = reader.GetDecimal(5);
                    ct.VenueName = reader.GetString(6);                   
                    list.Add(ct);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                conn.Close();
            }

            return list;
        }

    }
}