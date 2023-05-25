import unittest

# A simple function to test
def add(a, b):
    return a + b

# A test class inheriting from unittest.TestCase
class TestAddFunction(unittest.TestCase):

    def test_add_positive_numbers(self):
        result = add(2, 3)
        self.assertEqual(result, 5)  # Assert that the result is 5

    def test_add_negative_numbers(self):
        result = add(-2, -3)
        self.assertEqual(result, -5)  # Assert that the result is -5

    def test_add_zero(self):
        result = add(0, 5)
        self.assertEqual(result, 5)  # Assert that the result is 5

if __name__ == '__main__':
    unittest.main()
