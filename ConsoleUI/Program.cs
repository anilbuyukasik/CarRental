using Business.Concrete;
using Core.Entities.Concrete;
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
            RentalTest();



            //UserTest();
            //CarTest();
            //CustomerTest();
            //BrandTest();
            //ColorTest();

        }

        private static void RentalTest()
        {
            RentalManager rentalManager = new RentalManager(new EfRentalDal());
            Rental rental1 = new Rental { CarId = 1, CustomerId = 1, RentDate = DateTime.Parse("20-02-2020"), ReturnDate = DateTime.Parse("21-02-2020") };
            Rental rental2 = new Rental { CarId = 1, CustomerId = 2, RentDate = DateTime.Parse("21-02-2020"), ReturnDate = null };
            Rental rental3 = new Rental { CarId = 1, CustomerId = 1, RentDate = DateTime.Parse("22-02-2020"), ReturnDate = null };

            var result1 = rentalManager.Add(rental1).Message;
            var result2 = rentalManager.Add(rental2).Message;
            var result3 = rentalManager.Add(rental3).Message;

            Console.WriteLine(result1 + "\n" + result2 + "\n" + result3);

            foreach (var rental in rentalManager.GetAll().Data)
            {
                Console.WriteLine(rental.CarId + " " + rental.CustomerId + " " + rental.RentDate + " " + rental.ReturnDate);
            }
        }

        private static void CustomerTest()
        {
            CustomerManager customerManager = new CustomerManager(new EfCustomerDal());
            Customer customer1 = new Customer { UserId = 1, CompanyName = "AB Software" };
            Customer customer2 = new Customer { UserId = 2, CompanyName = "Kodlama.io" };

            customerManager.Add(customer1);
            customerManager.Add(customer2);

            foreach (var customer in customerManager.GetAll().Data)
            {
                Console.WriteLine(customer.CompanyName);
            }
        }

        private static void UserTest()
        {
            UserManager userManager = new UserManager(new EfUserDal());
            //User user1 = new User { FirstName = "Anıl", LastName = "Büyükaşık", Email = "buyukasik.anil@gmail.com", Password = "123456" };
            //User user2 = new User { FirstName = "Engin", LastName = "Demiroğ", Email = "engindemirog@gmail.com", Password = "654321" };

            //userManager.Add(user1);
            //userManager.Add(user2);
            foreach (var user in userManager.GetAll().Data)
            {
                Console.WriteLine(user.FirstName + " " + user.LastName);
            }
        }

        private static void ColorTest()
        {
            ColorManager colorManager = new ColorManager(new EfColorDal());
            Color color1 = new Color { ColorId = 1002, ColorName = "Gray1" };
            Color color2 = new Color { ColorName = "Orange" };
            Color color3 = new Color { ColorId = 4 };

            colorManager.Add(color2);
            colorManager.Update(color1);
            colorManager.Delete(color3);


            foreach (var color in colorManager.GetAll().Data)
            {
                Console.WriteLine(color.ColorName);
            }

            //colorManager.GetById(1);
        }

        private static void BrandTest()
        {
            BrandManager brandManager = new BrandManager(new EfBrandDal());
            Brand brand1 = new Brand { BrandName = "Honda" };
            Brand brand2 = new Brand { BrandId = 2, BrandName = "Mercedes Benz" };
            Brand brand3 = new Brand { BrandId = 5 };

            foreach (var brand in brandManager.GetAll().Data)
            {
                Console.WriteLine(brand.BrandName);
            }

            brandManager.GetById(2);
        }

        private static void CarTest()
        {
            CarManager carManager = new CarManager(new EfCarDal(),new BrandManager(new EfBrandDal()));

            var result = carManager.GetCarDetails();
            if (result.Success)
            {
                foreach (var car in result.Data)
                {
                    Console.WriteLine(car.CarName + " " + car.BrandName);
                }
            }
            else
            {
                Console.WriteLine(result.Message);
            }

            
            //foreach (var car in carManager.GetAll())
            //{
            //    Console.WriteLine(car.CarName);
            //}
            //Car car1 = new Car { ColorId = 2, BrandId = 2, CarName = "AMG", ModelYear = 2000, DailyPrice = 250, Description = "C Serisi" };
            //Car car2 = new Car { ColorId = 2, BrandId = 3, CarName = "Polo", ModelYear = 2016, DailyPrice = 250, Description = "Full Set" };
            //Car car3 = new Car { CarId = 2 };

            //carManager.Add(car1);
            //carManager.Add(car2);
            //carManager.Delete(car3);
            //carManager.Update(car2);
        }
    }
}
