using System;
using System.Collections.Generic;

namespace WebApi.Models;

public partial class Country
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Capital { get; set; } = null!;

    public bool State { get; set; }
}
