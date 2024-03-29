﻿using Paladins.Common.Interfaces.Admin.Pagination;

namespace Paladins.Common.Models.Admin
{
    /// <summary>
    /// Represents base search model
    /// </summary>
    public abstract partial class BaseSearchModel : IPagingRequestModel
    {
        
        public BaseSearchModel()
        {
            //set the default values
            Length = 10;
            AvailablePageSizes = "10, 20, 50, 100";
        }


        /// <summary>
        /// Gets a page number
        /// </summary>
        public int Page => (Start / Length) + 1;

        /// <summary>
        /// Gets a page size
        /// </summary>
        public int PageSize => Length;

        /// <summary>
        /// Gets or sets a comma-separated list of available page sizes
        /// </summary>
        public string AvailablePageSizes { get; set; }

        /// <summary>
        /// Gets or sets draw. Draw counter. 
        /// This is used by DataTables to ensure that the Ajax returns from server-side processing requests are drawn in sequence by DataTables 
        /// (Ajax requests are asynchronous and thus can return out of sequence).
        /// </summary>
        public string Draw { get; set; }

        /// <summary>
        /// Gets or sets skiping number of rows count. Paging first record indicator.
        /// </summary>
        public int Start { get; set; }

        /// <summary>
        /// Gets or sets paging length. Number of records that the table can display in the current draw. 
        /// </summary>
        public int Length { get; set; }

        /// <summary>
        /// Set grid page parameters
        /// </summary>
        /// <param name="pageSize">Page size; pass null to use default value</param>
        /// <param name="availablePageSizes">Available page sizes; pass null to use default value</param>
        public void SetGridPageSize(int pageSize, string availablePageSizes = null)
        {
            Start = 0;
            Length = pageSize;
            AvailablePageSizes = availablePageSizes;
        }
    }
}
