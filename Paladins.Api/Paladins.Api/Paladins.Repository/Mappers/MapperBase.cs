using Newtonsoft.Json;
using Paladins.Repository.SeedData.Data;
using Paladins.Repository.SeedData.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Paladins.Repository.Mappers
{
    /// <summary>
    /// Supplies method to load json file and deserialise it to a Root Object
    /// </summary>
    /// <typeparam name="TRoot">A root object to which the json file can deserialise to</typeparam>
    public class MapperBase<TRoot> where TRoot : IRootBase
    {
        public virtual TRoot LoadJson<TData>(TData data) where TData : DataRoot
        {
            string json = data.GetData();
            return JsonConvert.DeserializeObject<TRoot>(json);
        }
    }
}
