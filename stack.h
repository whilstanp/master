#pragma once
template <class tml>
class stack
{
	tml *item;
	int count;
public:
	stack()
	{
		count = 0;
	}
	void push(tml _item)
	{
		tml *temp = item;
		item = new tml[count + 1];
		for (int i = 0; i < count; i++) {
			item[i] = temp[i];
		}
		item[count] = _item;
		count++;
		if (count > 1) {
			delete[] temp;
		}
	}
	tml top(){
		if(!isempty()){ return item[count - 1]; }
		else { return tml(); }
	}
	tml pop(){
		if(!isempty())
		{
			tml *temp = item,ret;
			ret = item[count - 1];
			item = new tml[count - 1];
			for (int i = 0; i < count - 1; i++) {
				item[i] = temp[i];
			}
			count--;
			delete[] temp;
			return ret;
		}
		else { return tml(); }
	}
	//pop yg mg hps nilai top, bs d akali dgn pggl func top dlu
	/*void pop() {
		tml *temp = item;
		item = new tml[count - 1];
		for (int i = 0; i < count - 1; i++) {
			item = temp[i];
		}
		count--;
		delete[] temp;
	}*/
	bool isempty() {
		if (count == 0) {
			return true;
		}
		return false;
	}
	//sfml render functions
	int get_count()
	{
		return count;
	}
	tml* get_array()
	{
		return item;
	}
};