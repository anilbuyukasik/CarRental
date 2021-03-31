using Entities.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Business.ValidationRules.FluentValidation
{
    public class PaymentValidator : AbstractValidator<Payment>
    {
        public PaymentValidator()
        {
            RuleFor(p => p.RentalId).NotEmpty();
            RuleFor(p => p.CardOwnerName).NotEmpty();
            RuleFor(p => p.CardNo).NotEmpty();
            RuleFor(p => p.CardNo).Length(16);
            RuleFor(p => p.ExpirationDate).NotEmpty();
            RuleFor(p => p.Cvc).NotEmpty();
            RuleFor(p => p.Cvc).Length(3);
        }
    }
}
