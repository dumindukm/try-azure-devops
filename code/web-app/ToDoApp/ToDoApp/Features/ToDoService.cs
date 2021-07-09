using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ToDoApp.Features
{
    public class ToDoService
    {
        public List<ToDoItem> GetToDoItems()
        {
            List<ToDoItem> items = new List<ToDoItem>();

            return items;
        }
    }

    public class ToDoItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
