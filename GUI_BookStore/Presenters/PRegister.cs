using DTO_BookStore;
using GUI_BookStore.IViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GUI_BookStore.Presenters
{
    public class PRegister : Presenter<IRegisterView>
    {
        public PRegister(IRegisterView view) : base(view)
        {
        }

        public bool AddNewAccount()
        {
            string Username = View.Username;
            string Fullname = View.Fullname;
            string Password = View.Password;
            string ConfirmPassword = View.ConfirmPassword;
            string Role = View.Role;
            string Address = View.Address;
            string Phone = View.Phone;

            if (Password.Equals(ConfirmPassword))
            {
                return Model.AddNewAccount(new Account(Username, Fullname, Password, Role, Address, Phone));
            }
            else
            {
                throw new Exception("Password and Confirm Password are not match");
            }
        }
    }
}
