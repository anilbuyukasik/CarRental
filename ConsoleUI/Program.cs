using Business.Concrete;
using DataAccess.Concrete.EntityFramework;
using DataAccess.Concrete.InMemory;
using Entities.Concrete;
using System;

namespace ConsoleUI
{
    class Program
    {
        static void Main(string[] args)
        {
            CarManager carManager = new CarManager(new EfCarDal());
            //foreach (var car in carManager.GetByDailyPrice(99,120))
            //{
            //    Console.WriteLine(car.Description);
            //}
            carManager.Add(new Car { ColorId = 2, BrandId = 2, CarName="AMG", ModelYear = 2000, DailyPrice = 250, Description = "C Serisi" });
        }
    }
}
