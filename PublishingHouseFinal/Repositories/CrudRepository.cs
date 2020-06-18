using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PublishingHouseFinal.Repositories
{
    interface CrudRepository<T>
    {
        T save(T entity);
        List<T> getAll();
        T getById(int id);
        T update(T updatedEntity, int id);
        bool delete(int id);
        bool exists(int id);
    }
}
