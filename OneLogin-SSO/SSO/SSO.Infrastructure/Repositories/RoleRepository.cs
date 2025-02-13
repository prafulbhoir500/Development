using SSO.Domain;
using SSO.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SSO.Infrastructure.Repositories
{
    public class RoleRepository : IRoleRepository
    {
        public Task DeleteAsync(Role role)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Role>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Role> GetByIdAsync(int RoleID)
        {
            throw new NotImplementedException();
        }

        public Task SaveAsync(Role role)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(Role role)
        {
            throw new NotImplementedException();
        }
    }
}
