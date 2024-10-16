#include "pch.h"
#include <iostream>
#include "object.h"

int main()
{
	stack<int> x;
	x.push(2);
	x.push(3);
	x.push(4);
	while(!x.isempty()){
		std::cout << x.top() << "\n";
		x.pop();
	}
	Library texturesLibrary;
	Monster mrJelly;
	mrJelly.LoadTextures(texturesLibrary);

	sf::RenderWindow window(sf::VideoMode(800, 600), "SFML");
	sf::Clock anitime;
	while (window.isOpen())
	{
		sf::Event Event;
		while (window.pollEvent(Event))
		{
			if (Event.type == sf::Event::Closed)
			{
				window.close();
			}
		}
		window.clear();
		if(anitime.getElapsedTime().asSeconds>0.1f)
		{
			mrJelly.Animate();
			anitime.restart();
		}
		window.draw(*mrJelly.GetSprite());
		window.display();
	}
}