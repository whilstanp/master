#include <iostream>
using namespace std;
template <class T>
class queue
{
	T *item;
	int count;
public:
	queue<T>()
	{
		count = 0;
	}
	void enqueue(T _item)
	{
		T *temp = item;
		item = new T[count + 1];
		for (int i = 0; i < count; i++)
		{
			item[i] = temp[i];
		}
		item[count] = _item;
		count++;
		delete[] temp;
	}
	T dequeue()
	{
		T *temp = item, ret;
		ret = item[0];
		item = new T[count - 1];
		for (int i = 0; i < count; i++)
		{
			item[i] = temp[i + 1];
		}
		count--;
		delete[] temp;
		return ret;
	}
	T front()
	{
		return item[0];
	}
	bool isempty()
	{
		return (count <= 0);
	}
};
