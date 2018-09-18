#pragma once
#include "library.h"
#include "stack.h"
class Object
{
protected:
	int id, status, direction;
	int animFrame;
	sf::Texture *objectTextures;
	sf::Sprite objectSprite;
	int *objectTexturesCount;
public:
	sf::Sprite* GetSprite()
	{
		return &objectSprite;
	}
};

class Monster : public Object
{
public:
	Monster(int _id = 0, int _direction = 0, int _status = 0)
	{
		id = _id;
		direction = _direction;
		status = _status;
		animFrame = 0;
		objectTexturesCount = new int[3];
	}

	void LoadTextures(Library &texturesLibrary)
	{
		//std::cout << texturesLibrary.GetMonsterTexturesCount(id, status);
		objectTextures = texturesLibrary.GetMonsterTextures(id);
		objectTexturesCount[status] = texturesLibrary.GetMonsterTexturesCount(id, status);
		objectSprite.setTexture(objectTextures[direction]);
		objectSprite.setTextureRect(sf::IntRect(animFrame * (objectTextures[direction].getSize().x /
			objectTexturesCount[status]), 0, (objectTextures[direction].getSize().x /
				objectTexturesCount[status]), objectTextures[direction].getSize().y));
		//Urutan IntRect(posisiX, posisiY, panjang, tinggi);
	}

	void Animate()
	{
		objectSprite.setTexture(objectTextures[direction]);
		objectSprite.setTextureRect(sf::IntRect(animFrame * (objectTextures[direction].getSize().x /
			objectTexturesCount[status]), 0, (objectTextures[direction].getSize().x /
				objectTexturesCount[status]), objectTextures[direction].getSize().y));

		animFrame++;
		if (animFrame >= objectTexturesCount[status])
		{
			animFrame = 0;
		}
	}
};


