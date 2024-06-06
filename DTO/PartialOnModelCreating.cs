using Microsoft.EntityFrameworkCore;

namespace WebApi.DTO
{
    public partial class PartialOnModelCreating : DbContext
    {
        void OnModelCreatingPartial(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<ResponseSpDTO>(entity =>
            {
                entity.HasNoKey();

                entity.Property(e => e.Id);
                entity.Property(e => e.Name);
                entity.Property(e => e.Capital);
                entity.Property(e => e.State);
                entity.Property(e => e.IdRow);
            });
        }

    }
}
