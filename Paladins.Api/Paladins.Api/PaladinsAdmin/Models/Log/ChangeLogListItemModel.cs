﻿using System;

namespace PaladinsAdmin.Models.Log
{
    public class ChangeLogListItemModel
    {
        public string DatabaseName { get; set; }
        public string EventType { get; set; }
        public string ObjectName { get; set; }
        public string ObjectType { get; set; }
        public string SqlCommand { get; set; }
        public DateTime EventDate { get; set; }
        public string LoginName { get; set; }
    }
}
