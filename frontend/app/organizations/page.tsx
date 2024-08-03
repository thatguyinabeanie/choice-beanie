"use client";

import {
  Table,
  TableHeader,
  TableBody,
  TableColumn,
  TableRow,
  TableCell,
} from "@nextui-org/react";
import React from "react";

import { title } from "@/components/primitives";


const useOrganizations = () => {

  return [];
};

export default function OrganizationsPage () {
  const organizations = useOrganizations();

  return (
    <div>
      <h1 className={ title() }>Organizations</h1>

      <Table aria-label="Example table with dynamic content">
        <TableHeader>
          <TableColumn>ID</TableColumn>
          <TableColumn>Name</TableColumn>
          <TableColumn>Location</TableColumn>
        </TableHeader>
        <TableBody>
          { organizations.map((org) => (
            <TableRow key={ org.id }>
              <TableCell>{ org.id }</TableCell>
              <TableCell>{ org.name }</TableCell>
              <TableCell>{ org.owner.username }</TableCell>
            </TableRow>
          )) }
        </TableBody>
      </Table>
    </div>
  );
}
