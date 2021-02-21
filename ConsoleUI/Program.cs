using Business.Concrete;
using DataAccess.Abstract;
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
            //CarTest();

            //BrandTest();

            //ColorTest();

        }

        private static void ColorTest()
        {
            ColorManager colorManager = new ColorManager(new EfColorDal());
            Color color1 = new Color { ColorId = 1002, ColorName = "Gray1" };
            Color color2 = new Color { ColorName = "DarkBlue" };
            Color color3 = new Color { ColorId = 4 };

            colorManager.Add(color2);
            colorManager.Update(color1);
            colorManager.Delete(color3);


            foreach (var color in colorManager.GetAll())
            {
                Console.WriteLine(color.ColorName);
            }

            colorManager.GetById(1);
        }

        private static void BrandTest()
        {
            BrandManager brandManager = new BrandManager(new EfBrandDal());
            Brand brand1 = new Brand { BrandName = "Honda" };
            Brand brand2 = new Brand { BrandId = 2, BrandName = "Mercedes Benz" };
            Brand brand3 = new Brand { BrandId = 5 };

            foreach (var brand in brandManager.GetAll())
            {
                Console.WriteLine(brand.BrandName);
            }

            brandManager.GetById(2);
        }

        private static void CarTest()
        {
            CarManager carManager = new CarManager(new EfCarDal());
            foreach (var car in carManager.GetCarDetails())
            {
                Console.WriteLine(car.CarName + " " + car.BrandName);
            }
            foreach (var car in carManager.GetAll())
            {
                Console.WriteLine(car.CarName);
            }
            Car car1 = new Car { ColorId = 2, BrandId = 2, CarName = "AMG", ModelYear = 2000, DailyPrice = 250, Description = "C Serisi" };
            Car car2 = new Car { ColorId = 2, BrandId = 3, CarName = "Polo", ModelYear = 2016, DailyPrice = 250, Description = "Full Set" };
            Car car3 = new Car { CarId = 2 };

            carManager.Add(car1);
            carManager.Add(car2);
            carManager.Delete(car3);
            carManager.Update(car2);
        }
    }
}
