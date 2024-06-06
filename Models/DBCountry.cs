using Microsoft.EntityFrameworkCore;
using WebApi.DTO;

namespace WebApi.Models;

public partial class DBCountry : DbContext
{
    public DBCountry()
    {
    }

    public DBCountry(DbContextOptions<DBCountry> options)
        : base(options)
    {
    }

    public virtual DbSet<Contact> Contacts { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<ResponseSpDTO> spCountries { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Country__3214EC07E94F039E");

            entity.ToTable("Country");

            entity.Property(e => e.Capital).HasMaxLength(200);
            entity.Property(e => e.Name).HasMaxLength(200);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
