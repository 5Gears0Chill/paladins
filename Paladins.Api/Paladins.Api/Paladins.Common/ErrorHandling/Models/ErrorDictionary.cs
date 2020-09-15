﻿using System;
using System.Collections.Generic;

namespace Paladins.Common.ErrorHandling.Models
{
    public class ErrorDictionary<TObject>
    {
        public Dictionary<Type, TObject> typesDictionary = new Dictionary<Type, TObject>();

        public void Add<TException>(TObject obj) 
            where  TException : Exception
        {
            typesDictionary[typeof(TException)] = obj;
        }

        public TObject Get(Type type)
        {
            if(ContainsType(type) == false)
            {
                return default;
            }
            return typesDictionary[type];
        }

        public bool ContainsType(Type t)
        {
            return typesDictionary.ContainsKey(t) != false;
        }
    }
}
