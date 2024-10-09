using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Repositories
{
    public class GenericRepository<T> : IGenericDal<T> where T : class
    {
        protected readonly Context _context;

        public GenericRepository(Context context)
        {
            _context = context;
        }

        public async Task DeleteAsync(int id)
        {
            var entity = await _context.Set<T>().FindAsync(id); 
            if (entity != null)
            {
                _context.Set<T>().Remove(entity);
                await _context.SaveChangesAsync(); 
            }
        }
        public async Task<List<T>> GetAllAsync()
        {
            return await _context.Set<T>().ToListAsync(); 
        }

        public async Task<T> GetByIdAsync(int id)
        {
            var values = await _context.Set<T>().FindAsync(id); 
            return values;
        }

        public async Task InsertAsync(T entity)
        {
            await _context.Set<T>().AddAsync(entity); 
            await _context.SaveChangesAsync(); 
        }

        public async Task UpdateAsync(T entity)
        {
            _context.Set<T>().Update(entity);
            await _context.SaveChangesAsync(); 
        }

     
    }
}
