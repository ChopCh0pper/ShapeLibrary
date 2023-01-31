namespace ShapeLibrary
{
    public abstract class Shape
    {
        private readonly double area;
        protected Shape(double area)
        {
            this.area = area;
        }  

        public double Area() => area;
    }

     public class Circle : Shape
    {
        private const double PI = 3.14;
        public Circle (double r) : base(PI * r * r)
        {
            if (r <= 0) 
                throw new ArgumentException("Provided radius is not a positive double");
        }
    }

    public class Triangle : Shape
    {
        private double a, b, c;
        public Triangle (double a, double b, double c) : base(Math.Sqrt((a + b + c) / 2 * (((a + b + c) / 2) - a) * (((a + b + c) / 2) - b) * (((a + b + c) / 2) - c)))
        {
            if (a <= 0 || b <= 0 || c <= 0) 
                throw new ArgumentException("Provided side length is not a positive double");
            else if (a + b < c || a + c < b || b + c < a) 
                throw new ArgumentException("Provided sides do not form a triangle");

            this.a = a; this.b = b; this.c = c;
        }

        public bool IsRight()
        {
            return ((a*a + b*b == c*c) || (a*a + c*c == b*b) || (b*b + c*c == a*a));
        }
    }
}