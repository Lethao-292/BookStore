using DTO_BookStore;
using GUI_BookStore.IViews;
using GUI_BookStore.UserControls;
using GUI_BookStore.Views.Popup;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GUI_BookStore.Presenters
{
    public class PHome : Presenter<IHomeView>
    {
        public PHome(UC_Home view) : base(view)
        {
            
        }

        public void GetBooks(string SearchBy, string SearchContext, string Language, string CategoryName)
        {
            List<Book> BookList = Model.GetBooks(SearchBy, SearchContext, Language, CategoryName);
            View.FlowPanel.Controls.Clear();
            foreach(Book book in BookList)
            {
                UC_BookDetails uc = new UC_BookDetails(book);
                View.FlowPanel.Controls.Add(uc);
            }
        }

        public void GetAllCategoryName()
        {
            List<string> CategoryList = Model.GetAllCategoryName();
            foreach(string c in CategoryList)
            {
                View.CheckedList.Items.Add(c);
            }
        }
    }
}
