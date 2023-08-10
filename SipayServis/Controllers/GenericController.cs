using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SipayBussiness.Services;

namespace SipayServis.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GenericController<TEntity> : ControllerBase where TEntity : class
    {
        private readonly IGenericService<TEntity> _genericService;

        public GenericController(IGenericService<TEntity> genericService)
        {
            _genericService = genericService;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TEntity>> GetById(int id)
        {
            var entity = await _genericService.GetByIdAsync(id);
            if (entity == null)
            {
                return NotFound();
            }
            return entity;
        }

        [HttpPost]
        public async Task<ActionResult<TEntity>> Create(TEntity entity)
        {
            await _genericService.CreateAsync(entity);
            return CreatedAtAction(nameof(GetById), new { id = entity.GetType().GetProperty("Id").GetValue(entity) }, entity);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, TEntity entity)
        {
            if (id != (int)entity.GetType().GetProperty("Id").GetValue(entity))
            {
                return BadRequest();
            }

            var existingEntity = await _genericService.GetByIdAsync(id);
            if (existingEntity == null)
            {
                return NotFound();
            }

            await _genericService.UpdateAsync(entity);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entity = await _genericService.GetByIdAsync(id);
            if (entity == null)
            {
                return NotFound();
            }

            await _genericService.DeleteAsync(entity);

            return NoContent();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<TEntity>>> GetAll()
        {
            var entities = await _genericService.GetAllAsync();
            return Ok(entities);
        }
    }
}
