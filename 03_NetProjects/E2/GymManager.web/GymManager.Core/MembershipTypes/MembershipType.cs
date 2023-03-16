using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace GymManager.Core.MembershipTypes
{
    public class MembershipType
    {
        //Model Properties
        public int Id { get; set; }

        [StringLength(100)]
        [Required]
        public string Name { get; set; }

        [Required]
        [NotNull]
        [Range(0,100000)]
        public double Cost { get; set; }

        [BindProperty, DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        [Required]
        public DateTime CreatedOn { get; set; }

        [Required]
        [NotNull]
        [Range(0, 100000)]
        public int Duration { get; set; }


    }
}
