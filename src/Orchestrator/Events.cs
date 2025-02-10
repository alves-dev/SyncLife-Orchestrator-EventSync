namespace Orchestrator
{
    public class Events
    {
      
        public delegate void MessageEventHandler(string message);

        public event MessageEventHandler RabbitMessageReceived;

        public event MessageEventHandler MQTTMessageReceived;

        public void LaunchRabbitMessageReceived(string message)
        {
            RabbitMessageReceived?.Invoke(message);
        }

        public void LaunchMQTTMessageReceived(string message)
        {
            MQTTMessageReceived?.Invoke(message);
        }
    }
}