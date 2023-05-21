// See https://aka.ms/new-console-template for more information
using Linq.Examples.Entities;

class Program
{
    static IList<Student> studentList = new List<Student>()
{
    new Student() {StudentID = 1,StudentName = "John", Age = 18, StandardID = 1 },
    new Student() {StudentID = 2,StudentName = "Steve", Age = 21, StandardID = 1 },
    new Student() {StudentID = 3,StudentName = "Bill", Age = 18, StandardID = 2 },
    new Student() {StudentID = 4,StudentName = "Ram", Age = 20, StandardID = 2 },
    new Student() {StudentID = 5,StudentName = "Ron", Age = 21 },
    new Student() {StudentID = 6,StudentName = "Morty", Age = 14 }
};


    static IList<Standard> standardList = new List<Standard>()
{
    new Standard() {StandardID = 1,StandardName = "Standard 1"},
    new Standard() {StandardID = 2,StandardName = "Standard 2"},
    new Standard() {StandardID = 3,StandardName = "Standard 3"}

};

    static void Main(string[] args) {

        //Count the students with 18 years
        //var test = studentList.Where(x => x.Age >= 18).Count();

        //Count students with standard id greater than zero
        //var test = studentList.Where(x => x.Age >= 18).Where(st => st.StandardID > 0).Count();

        //Select only the nanmes of the list 
        //var test = studentList.Where(x => x.Age >= 18).Where(st => st.StandardID > 0).Select(x=>x.StudentName);

        var test = studentList.Where(x=> (x.Age >= 18 && x.StandardID > 0))
            .Select(x => x.StudentName);

        //Filter by age 
        var teenStudentsName = from s in studentList
                               where s.Age > 12 && s.Age < 20
                               select new { Name2 = s.StudentName };

        //Group of Standard Id
        /*
        var studentsGroupByStandard = from s in studentList
                                      group s by s.StandardID into sg
                                      orderby sg.Key
                                      select new { StandardID = sg.Key, 
                                          Items = sg };
        */
        //Group of Standard Id and age filtering
        var studentsGroupByStandard = from s in studentList
                                      where s.Age > 12 && s.Age < 20
                                      group s by s.StandardID into sg
                                      orderby sg.Key
                                      select new
                                      {
                                          StandardID = sg.Key,
                                          Items = sg
                                      };

        var studentWithStandard = from s in studentList
                                  join stad in standardList
                                  on s.StandardID equals stad.StandardID
                                  select new
                                  {
                                      StudentName = s.StudentName,
                                      StandardName = stad.StandardName
                                  };


        /*
        foreach (var element in studentsGroupByStandard) {
            //Console.WriteLine(element);
            Console.WriteLine(element.StandardID);
            foreach(var student in element.Items){
                Console.WriteLine(student.StudentName);
            }
            Console.WriteLine();
        }
        */

        foreach ( var element in studentWithStandard)
        {
            Console.WriteLine($"Student: {element.StudentName} is in {element.StandardName}");
        }

        //Console.WriteLine(test.GetType);

        Console.ReadKey();

    }
}






