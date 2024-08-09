"use client";

import {
  Table,
  TableHeader,
  TableColumn,
  TableBody,
  TableRow,
  TableCell,
  getKeyValue,
} from "@nextui-org/react";
import * as React from "react";

import { Tournament } from "@/api";

export interface TournamentsTableProps {
  tournaments: Tournament[];
  columns: { key: string; label: string }[];
}

const columns = [
  {
    key: "start_at",
    label: "DATE",
  },
  {
    key: "name",
    label: "NAME",
  },
  {
    key: "player_cap",
    label: "PLAYER CAP",
  },
  {
    key: "organization.name",
    label: "Organization",
  },
];

const TournamentsTable = ({ tournaments }: TournamentsTableProps) => {
  return (
    <Table aria-label="Example table with dynamic content">
      <TableHeader columns={columns}>
        {(column) => <TableColumn key={column.key}>{column.label}</TableColumn>}
      </TableHeader>
      <TableBody items={tournaments}>
        {(item) => (
          <TableRow key={item.id}>
            {(columnKey) => (
              <TableCell>{getKeyValue(item, columnKey)}</TableCell>
            )}
          </TableRow>
        )}
      </TableBody>
    </Table>
  );
};

export default TournamentsTable;
