using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Online_Ticket_System.CSharpCode
{
    class Users
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string UserType { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zipcode { get; set; }


        public Users(int id, string username, string password, string firstname, string lastname, string email, string usertype,string phone, string add1, string add2, string city, string state, string zip)
        {
            ID = id;
            Username = username;
            Password = password;
            Email = email;
            UserType = usertype;
            FirstName = firstname;
            LastName = lastname;
            Phone = phone;
            Address1 = add1;
            Address2 = add2;
            City = city;
            State = state;
            Zipcode = zip;
        }
        public Users(string username, string password, string firstname, string lastname, string email, string usertype)
        {
            Username = username;
            Password = password;
            Email = email;
            UserType = usertype;
            FirstName = firstname;
            LastName = lastname;
        }
    }
}
