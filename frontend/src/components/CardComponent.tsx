import React from 'react';

interface Card {
  id: number;
  name: string;
  email: string;
}

const CardComponent: React.FC<{ card: Card }> = ({ card }) => {
  return (
    <div className="bg-white shadow-lg rounded-lg p-2 mb-2 hover:bg-gray-100 w-[17rem]">
      <div className="text-xs text-gray-600">Id: {card.id}</div>
      <div className="text-md font-semibold text-gray-800">{card.name}</div>
      <div className="text-xm text-gray-700">{card.email}</div>
    </div>
  );
};

export default CardComponent;
