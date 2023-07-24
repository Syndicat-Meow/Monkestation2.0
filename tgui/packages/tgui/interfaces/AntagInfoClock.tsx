import { useBackend } from '../backend';
import { Icon, Section, Stack } from '../components';
import { Window } from '../layouts';

type Objective = {
  count: number;
  name: string;
  explanation: string;
};

type Info = {
  antag_name: string;
  objectives: Objective[];
};

export const AntagInfoClock = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { antag_name } = data;
  return (
    <Window width={620} height={250} theme="clockwork">
      <Window.Content>
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item fontSize="20px" color={'good'}>
              <Icon name={'cog'} rotation={0} spin={1} />
              {' You are the ' + antag_name + '! '}
              <Icon name={'cog'} rotation={35} spin={1} />
            </Stack.Item>
            <Stack.Item>
              <ObjectivePrintout />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};

const ObjectivePrintout = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { objectives } = data;
  return (
    <Stack vertical>
      <Stack.Item bold>To serve Rat&#39;var you must:</Stack.Item>
      <Stack.Item>
        {(!objectives && 'None!') ||
          objectives.map((objective) => (
            <Stack.Item key={objective.count}>
              #{objective.count}: {objective.explanation}
            </Stack.Item>
          ))}
      </Stack.Item>
    </Stack>
  );
};
