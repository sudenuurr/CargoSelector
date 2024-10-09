﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Abstract
{
    public interface IGenericDal<T> where T : class
    {
        Task InsertAsync(T entity);         
        Task UpdateAsync(T entity);           
        Task DeleteAsync(int id);             
        Task<List<T>> GetAllAsync();
        Task<T> GetByIdAsync(int id);
    }
}
