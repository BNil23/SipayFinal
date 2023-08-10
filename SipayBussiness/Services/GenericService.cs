using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SipayData; // veya Veritabanı işlemlerinin yapıldığı katmana uygun using ifadesi
using SipayData.Repositories;

namespace SipayBussiness.Services
{
    public class GenericService<TEntity> : IGenericService<TEntity> where TEntity : class
    {
        private readonly IGenericRepository<TEntity> _repository;

        public GenericService(IGenericRepository<TEntity> repository)
        {
            _repository = repository;
        }

        public async Task<List<TEntity>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }

        public async Task<TEntity> GetByIdAsync(int id)
        {
            return await _repository.GetByIdAsync(id);
        }

        public async Task<List<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate)
        {
            return await _repository.FindAsync(predicate);
        }

        public async Task<TEntity> SingleOrDefaultAsync(Expression<Func<TEntity, bool>> predicate)
        {
            return await _repository.SingleOrDefaultAsync(predicate);
        }

        public async Task CreateAsync(TEntity entity)
        {
            await _repository.AddAsync(entity);
        }

        public async Task CreateRangeAsync(IEnumerable<TEntity> entities)
        {
            await _repository.AddRangeAsync(entities);
        }

        public async Task UpdateAsync(TEntity entity)
        {
            // Implement your update logic here, using the repository
            _repository.Update(entity);
            await _repository.SaveChangesAsync();
        }

        public async Task DeleteAsync(TEntity entity)
        {
            // Implement your delete logic here, using the repository
            _repository.Remove(entity);
            await _repository.SaveChangesAsync();
        }

        public void RemoveRange(IEnumerable<TEntity> entities)
        {
            _repository.RemoveRange(entities);
        }
    }
}
