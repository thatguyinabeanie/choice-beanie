import React, { useEffect, useState } from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper } from '@mui/material';
import { GamesApi, Game } from '../api'; // Adjust the import path based on your project structure

const GamesTable: React.FC = () => {
  const [games, setGames] = useState<Game[]>([]);

  useEffect(() => {
    const fetchGames = async () => {
      try {
        const api = new GamesApi();
        const response = await api.getGames(); // Adjust the method name based on your OpenAPI client
        setGames(response.data);
      } catch (error) {
        console.error('Error fetching games:', error);
      }
    };

    fetchGames();
  }, []);

  return (
    <TableContainer component={ Paper }>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>ID</TableCell>
            <TableCell>Name</TableCell>
            <TableCell>Genre</TableCell>
            <TableCell>Release Date</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          { games.map((game) => (
            <TableRow key={ game.id }>
              <TableCell>{ game.id }</TableCell>
              <TableCell>{ game.name }</TableCell>

            </TableRow>
          )) }
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default GamesTable;
