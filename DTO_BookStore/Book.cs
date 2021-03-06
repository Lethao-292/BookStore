using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_BookStore
{
    public class Book
    {
        public int BookID { get; private set; }
        public string Title { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public string Author { get; set; }
        public string Publisher { get; set; }
        public bool IsLocalBook { get; set; }
        public string Image { get; set; }
        public Category BookCategory { get; set; }
        public Book()
        {

        }
        public Book (int BookID, string Title, int Price, int Quantity, string Author, string Publisher, bool IsLocalBook, string Image, Category BookCategory)
        {
            this.BookID = BookID;
            this.Title = Title;
            this.Price = Price;
            this.Quantity = Quantity;
            this.Author = Author;
            this.Publisher = Publisher;
            this.IsLocalBook = IsLocalBook;
            this.BookCategory = BookCategory;
            this.Image = Image;
        }
    }
}
