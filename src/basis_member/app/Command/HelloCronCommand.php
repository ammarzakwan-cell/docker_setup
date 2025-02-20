<?php

namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Attribute\AsCommand;

#[AsCommand(
    name: 'app:hello-cron',
    description: 'A simple cron job command.',
)]
class HelloCronCommand extends Command
{
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $output->writeln('Hello! This is a cron job running in Symfony. date : ' . date('Y-m-d H:i:s'));

        return Command::SUCCESS;
    }
}
