using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace SipayBussiness.Services
{
    public interface IGenericService<TEntity> where TEntity : class
    {
        Task<List<TEntity>> GetAllAsync();
        Task<TEntity> GetByIdAsync(int id);
        Task<List<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate);
        Task<TEntity> SingleOrDefaultAsync(Expression<Func<TEntity, bool>> predicate);
        Task CreateAsync(TEntity entity);
        Task CreateRangeAsync(IEnumerable<TEntity> entities);
        Task UpdateAsync(TEntity entity);
        Task DeleteAsync(TEntity entity);
        void RemoveRange(IEnumerable<TEntity> entities);
    }
}
